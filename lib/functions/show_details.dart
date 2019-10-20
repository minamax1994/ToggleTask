import 'package:flutter/material.dart';
import 'package:toggle_task/components/details_item.dart';

import '../model/model.dart';
import 'seconds_to_time_string.dart';

void showDetails(BuildContext context, TimeEntry timeEntry, String projectName,
    String clientName) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DetailsItem(Icons.title, 'Title', timeEntry.description),
              DetailsItem(
                Icons.access_time,
                'Start Time',
                timeEntry.start.replaceAll(RegExp('T'), '  ').substring(0, 20),
              ),
              DetailsItem(
                Icons.timelapse,
                'End Time',
                timeEntry.stop.replaceAll(RegExp('T'), '  ').substring(0, 20),
              ),
              DetailsItem(
                Icons.av_timer,
                'Duration',
                secondsToTimeString(timeEntry.duration),
              ),
              DetailsItem(Icons.work, 'Project', projectName),
              DetailsItem(Icons.person, 'Client', clientName),
            ],
          ),
        );
      });
}
