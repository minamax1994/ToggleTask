import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';
import '../functions/timedate_to_string.dart';

class ApiService {
  static ApiService instance = ApiService();
  SharedPreferences prefs;
  String baseUrl = 'https://www.toggl.com/api/';
  String apiVersion = 'v8/';
  Map<String, String> headers;
  String username;
  String password;

  Future<String> loginUser(Map<String, dynamic> formData) async {
    username = formData['username'];
    password = formData['password'];
    http.Response response =
        await http.get(baseUrl + apiVersion + 'me', headers: {
      "Authorization":
          'Basic ' + base64Encode(utf8.encode('$username:$password')),
      "Content-type": "application/x-www-form-urlencoded",
      "Accept": "application/json"
    });
    if (response.body != null) {
      final jsonData = json.decode(response.body);
      LoginResponse responseData = LoginResponse.fromJson(jsonData);
      print(responseData.toString());
      if (response.statusCode == 200) {
        prefs = await SharedPreferences.getInstance();
        prefs.setString('token', responseData.data.apiToken);
        return 'ok';
      } else {
        return 'Error Code ${response.statusCode}';
      }
    } else {
      return 'Error Code ${response.statusCode}';
    }
  }

  Future<List<TimeEntry>> fetchTimeEntries(
      DateTime startDate, DateTime endDate) async {
    String start = timeDateToString(startDate);
    String end = timeDateToString(endDate);
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    http.Response response = await http.get(
        baseUrl +
            apiVersion +
            'time_entries' +
            '?' +
            'start_date=$start' +
            '&' +
            'end_date=$end',
        headers: {
          "Authorization":
              'Basic ' + base64Encode(utf8.encode('$token:api_token')),
          "Content-type": "application/x-www-form-urlencoded",
          "Accept": "application/json"
        });
    List<TimeEntry> responseData = List<TimeEntry>();
    if (response.body != null) {
      final List<dynamic> jsonData = json.decode(response.body);
      for (int i = 0; i < jsonData.length; i++) {
        responseData.add(TimeEntry.fromJson(jsonData[i]));
      }
      print(responseData.toString());
      if (response.statusCode != 200) {
        print('Error Code ${response.statusCode}');
      }
    }
    return responseData;
  }

  Future<Project> fetchProject(int projectId) async {
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    http.Response response = await http.get(
        baseUrl + apiVersion + 'projects/' + projectId.toString(),
        headers: {
          "Authorization":
              'Basic ' + base64Encode(utf8.encode('$token:api_token')),
          "Content-type": "application/x-www-form-urlencoded",
          "Accept": "application/json"
        });
    Project responseData = Project();
    if (response.body != null) {
      final jsonData = json.decode(response.body);
      responseData = Project.fromJson(jsonData);
      print(responseData.toString());
      if (response.statusCode != 200) {
        print('Error Code ${response.statusCode}');
      }
    }
    return responseData;
  }

  Future<Client> fetchClient(int clientId) async {
    prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    http.Response response = await http.get(
        baseUrl + apiVersion + 'clients/' + clientId.toString(),
        headers: {
          "Authorization":
              'Basic ' + base64Encode(utf8.encode('$token:api_token')),
          "Content-type": "application/x-www-form-urlencoded",
          "Accept": "application/json"
        });
    Client responseData = Client();
    if (response.body != null) {
      final jsonData = json.decode(response.body);
      responseData = Client.fromJson(jsonData);
      print(responseData.toString());
      if (response.statusCode != 200) {
        print('Error Code ${response.statusCode}');
      }
    }
    return responseData;
  }
}
