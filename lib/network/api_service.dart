import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';

class ApiService {
  static ApiService instance = ApiService();
  SharedPreferences prefs;
  String baseUrl = 'https://www.toggl.com/api/';
  String apiVersion = 'v8/';
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
      MeResponse responseData = MeResponse.fromJson(jsonData);
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
}
