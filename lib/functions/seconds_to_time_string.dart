import '../functions/timedate_to_string.dart';

String secondsToTimeString(int seconds) {
  DateTime time = DateTime.utc(0, 0, 0, 0, 0, seconds);
  return timeDateToString(time).substring(9,17);
}
