import 'package:flutter/material.dart';

import '../components/global_widgets.dart' as global;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: global.appBar,
      body: Container(),
    );
  }
}