import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

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
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            if (connectivity == ConnectivityResult.none) {
              return Center(
                child: Text(
                  'No Internet Access',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return StreamBuilder<List<TimeEntry>>(
                stream: bloc.timeEntriesStream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<TimeEntry>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.isEmpty) {
                      return Center(
                        child: Text(
                          'No Time Entries',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    int currentTimestamp = 0;
                    List<TimestampView> timestamps =
                        _calculateTimestamps(snapshot);
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
                                snapshot.data[index - 1].start
                                    .substring(8, 10)) {
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
                    bloc.fetchTimeEntries(
                        DateTime.now().add(Duration(days: -30)),
                        DateTime.now());
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            }
          },
          child: Container(),
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
