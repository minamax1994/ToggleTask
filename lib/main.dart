import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './pages/login_page.dart';
import './pages/home_page.dart';

void main() => runApp(TogglApp());

class TogglApp extends StatefulWidget {
  @override
  _TogglAppState createState() => _TogglAppState();
}

class _TogglAppState extends State<TogglApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loader(),
      debugShowCheckedModeBanner: false,
      title: 'Toggl',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.black,
        buttonColor: Colors.black,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  void _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token != null) {
      Navigator.of(context).pushNamed('/home');
    } else {
      Navigator.of(context).pushNamed('/login');
    }
  }

  void initState() {
    super.initState();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
