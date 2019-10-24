import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './pages/login_page.dart';
import './pages/home_page.dart';

void main() => runApp(TogglApp());

class TogglApp extends StatelessWidget {
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
  Future<String> _getTokenFuture;

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    String route;
    if (token != null) {
      route = '/home';
    } else {
      route = '/login';
    }
    return route;
  }

  void initState() {
    super.initState();
    _getTokenFuture = _getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: _getTokenFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == '/home')
                return HomePage();
              else
                return LoginPage();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
