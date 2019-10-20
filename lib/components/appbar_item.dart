import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: Text(
      'Toggl',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
    ),
    actions: <Widget>[
      FlatButton(
        // color: Colors.red,
        textColor: Colors.white,
        child: Text('LOGOUT'),
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.of(context).pushReplacementNamed('/login');
        },
      ),
    ],
  );
}
