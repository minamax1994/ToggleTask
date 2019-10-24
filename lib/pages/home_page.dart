import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../model/model.dart';
import '../bloc/home_bloc.dart';
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
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.fetchTimeEntries(
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
                stream: homeBloc.timeEntriesStream,
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
                    homeBloc.fetchTimeEntries(
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
    Map<String, TimestampView> timestampViews = Map<String, TimestampView>();
    for (TimeEntry timeEntry in snapshot.data) {
      String day = getDayString(timeEntry.start);
      TimestampView view = timestampViews[day];
      if (view != null) {
        timestampViews[day] =
            TimestampView(timeEntry.start, view.duration + timeEntry.duration);
      } else {
        timestampViews[day] =
            TimestampView(timeEntry.start, timeEntry.duration);
      }
    }
    List<TimestampView> values = timestampViews.values.toList();
    values.sort((left, right) => right.date.compareTo(left.date));
    return values;
  }

  String getDayString(String date) {
    return date.substring(8, 10);
  }
}
