import 'package:scoped_model/scoped_model.dart';
import 'package:toggle_task/network/api_service.dart';

import '../model.dart';

class TimeEntryListModel extends Model {
  List<TimeEntry> _timeEntries = [];
  bool _isLoading = false;

  List<TimeEntry> get timeEntries => List.from(_timeEntries);
  bool get isLoading => _isLoading;

  void fetchTimeEntries(DateTime startDate, DateTime endDate) async {
    _isLoading = true;
    notifyListeners();
    _timeEntries =
        await ApiService.instance.fetchTimeEntries(startDate, endDate);
    _timeEntries.sort((a, b) => b.start.compareTo(a.start));
    _isLoading = false;
    notifyListeners();
  }
}
