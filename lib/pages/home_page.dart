import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:toggle_task/model/scoped_model/time_entry_list.dart';

import '../model/model.dart';
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
  TimeEntryListModel model = TimeEntryListModel();

  @override
  void initState() {
    model.fetchTimeEntries(
        DateTime.now().add(Duration(days: -30)), DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitApp(),
      child: ScopedModel<TimeEntryListModel>(
        model: model,
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
                return ScopedModelDescendant<TimeEntryListModel>(
                  builder: (BuildContext context, _, TimeEntryListModel model) =>
                      model.isLoading
                          ? _buildLoading()
                          : model.timeEntries.isEmpty
                              ? _buildNoEntries()
                              : _buildTimeEntries(),
                );
              }
            },
            child: Container(),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    // model.fetchTimeEntries(
    //     DateTime.now().add(Duration(days: -30)), DateTime.now());
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildNoEntries() {
    return Center(
        child: Text(
      'No Time Entries',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
  }

  Widget _buildTimeEntries() {
    int currentTimestamp = 0;
    List<TimestampView> timestamps = _calculateTimestamps(model);
    return ScopedModelDescendant<TimeEntryListModel>(
      builder: (BuildContext context, _, TimeEntryListModel model) =>
          ListView.builder(
              itemCount: model.timeEntries.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  currentTimestamp++;
                  return Column(
                    children: <Widget>[
                      timestamps[currentTimestamp - 1],
                      TimeEntryView(model.timeEntries[index]),
                    ],
                  );
                } else {
                  if (getDayString(model.timeEntries[index].start) ==
                      getDayString(model.timeEntries[index - 1].start)) {
                    return Column(
                      children: <Widget>[
                        TimeEntryView(model.timeEntries[index]),
                      ],
                    );
                  } else {
                    currentTimestamp++;
                    return Column(
                      children: <Widget>[
                        timestamps[currentTimestamp - 1],
                        TimeEntryView(model.timeEntries[index]),
                      ],
                    );
                  }
                }
              }),
    );
  }

  List<TimestampView> _calculateTimestamps(TimeEntryListModel model) {
    Map<String, TimestampView> timestampViews = Map<String, TimestampView>();
    for (TimeEntry timeEntry in model.timeEntries) {
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
