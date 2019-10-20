import 'package:flutter/material.dart';

import '../model/model.dart';
import '../bloc/bloc.dart';
import '../components/appbar_item.dart';
import '../components/time_entry_view.dart';
import '../components/timestamp_view.dart';
import '../functions/exit_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TimeEntry> timeEntries;

  @override
  void initState() {
    bloc.fetchTimeEntries(
        DateTime.now().add(Duration(days: -30)), DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitApp(),
      child: Scaffold(
        appBar: appBar(context),
        body: StreamBuilder<List<TimeEntry>>(
          stream: bloc.timeEntriesStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<TimeEntry>> snapshot) {
            if (snapshot.hasData) {
              int currentTimestamp = 0;
              List<TimestampView> timestamps = _calculateTimestamps(snapshot);
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      currentTimestamp++;
                      return Column(
                        children: <Widget>[
                          timestamps[currentTimestamp - 1],
                          TimeEntryView(snapshot.data[index]),
                        ],
                      );
                    } else {
                      if (snapshot.data[index].start.substring(8, 10) ==
                          snapshot.data[index - 1].start.substring(8, 10)) {
                        return Column(
                          children: <Widget>[
                            TimeEntryView(snapshot.data[index]),
                          ],
                        );
                      } else {
                        currentTimestamp++;
                        return Column(
                          children: <Widget>[
                            timestamps[currentTimestamp - 1],
                            TimeEntryView(snapshot.data[index]),
                          ],
                        );
                      }
                    }
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  List<TimestampView> _calculateTimestamps(
      AsyncSnapshot<List<TimeEntry>> snapshot) {
    int dailyDuration = 0;
    List<TimestampView> timestamps = List<TimestampView>();
    for (int i = 0; i < snapshot.data.length; i++) {
      if (i == 0) {
        dailyDuration += snapshot.data[i].duration;
        timestamps.add(TimestampView(snapshot.data[i].start, dailyDuration));
      } else {
        if (snapshot.data[i].start.substring(8, 10) ==
            snapshot.data[i - 1].start.substring(8, 10)) {
          dailyDuration += snapshot.data[i].duration;
          timestamps.last =
              TimestampView(snapshot.data[i].start, dailyDuration);
        } else {
          dailyDuration = 0;
          dailyDuration += snapshot.data[i].duration;
          timestamps.add(TimestampView(snapshot.data[i].start, dailyDuration));
        }
      }
    }
    return timestamps;
  }
}
