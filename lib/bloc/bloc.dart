import 'package:rxdart/rxdart.dart';

import '../model/model.dart';
import '../network/api_service.dart';

class Bloc {
  String loginResponse;
  List<TimeEntry> timeEntries;

  final _timeEntriesFetcher = PublishSubject<List<TimeEntry>>();

  Observable<List<TimeEntry>> get timeEntriesStream =>
      _timeEntriesFetcher.stream;

  Future<String> loginUser(Map<String, dynamic> formData) async {
    loginResponse = await ApiService.instance.loginUser(formData);
    return loginResponse;
  }

  void fetchTimeEntries(DateTime startDate, DateTime endDate) async {
    timeEntries =
        await ApiService.instance.fetchTimeEntries(startDate, endDate);
    timeEntries.sort((a, b) => b.start.compareTo(a.start));
    _timeEntriesFetcher.sink.add(timeEntries);
  }

  void dispose() {
    _timeEntriesFetcher.close();
  }
}

final Bloc bloc = Bloc();
