import 'package:flutter/services.dart';

Future<Null> exitApp() async {
  return await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}
