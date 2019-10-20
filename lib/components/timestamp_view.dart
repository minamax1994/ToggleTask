import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../functions/seconds_to_time_string.dart';

class TimestampView extends StatefulWidget {
  final String date;
  final int duration;

  TimestampView(this.date, this.duration);

  @override
  _TimestampViewState createState() => _TimestampViewState();
}

class _TimestampViewState extends State<TimestampView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            numericalDateToEnglishDate(widget.date),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(
            secondsToTimeString(widget.duration),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.redAccent),
          ),
        ],
      ),
    );
  }

  String numericalDateToEnglishDate(String numericalDate) {
    int year = int.parse(numericalDate.substring(0, 4));
    int month = int.parse(numericalDate.substring(5, 7));
    int day = int.parse(numericalDate.substring(8, 10));
    return formatDate(
        DateTime(year, month, day), [DD, ', ', dd, ' ', MM, ', ', yyyy]);
  }
}
