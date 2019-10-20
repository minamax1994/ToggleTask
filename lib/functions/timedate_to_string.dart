String timeDateToString(DateTime date) {
  String day, month, year, hours, minutes, seconds;
  date.day < 10 ? day = '0' + date.day.toString() : day = date.day.toString();
  date.month < 10
      ? month = '0' + date.month.toString()
      : month = date.month.toString();
  year = date.year.toString();
  date.hour < 10
      ? hours = '0' + date.hour.toString()
      : hours = date.hour.toString();
  date.minute < 10
      ? minutes = '0' + date.minute.toString()
      : minutes = date.minute.toString();
  date.second < 10
      ? seconds = '0' + date.second.toString()
      : seconds = date.second.toString();
  return '$year-$month-$day' + 'T' + '$hours:$minutes:$seconds' + 'Z';
}