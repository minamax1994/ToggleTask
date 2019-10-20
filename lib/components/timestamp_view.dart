import 'package:flutter/material.dart';

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
            widget.date.substring(0,10),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(
            secondsToTimeString(widget.duration),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
