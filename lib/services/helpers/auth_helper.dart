import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:job_finder/models/request/auth/login_model.dart';
import 'package:job_finder/models/request/auth/profile_update_model.dart';
import 'package:job_finder/models/response/auth/login_res_model.dart';
import 'package:job_finder/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {"Content-Type": 'application/json'};
    var url = Uri.https(Config.apiUrl, Config.loginUrl);
    log(url.toString());
    log(model.toString());
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model));

    log(jsonEncode(model));
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = loginResponseModelFromJson(response.body).userToken;
      String userId = loginResponseModelFromJson(response.body).profile;
      String profile = loginResponseModelFromJson(response.body).userToken;
      log(response.body.toString());
      await prefs.setString('token', token);
      await prefs.setString('userId', userId);
      await prefs.setString('profile', profile);

      await prefs.setBool("loggedIn", true);
      return true;
    } else {
      log(response.body.toString());
      return false;
    }
  }

  static Future<bool> updateProfile(ProfileUpdateReq model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      "Content-Type": 'application/json',
      "token": "Bearer $token"
    };
    var url = Uri.https(Config.apiUrl, Config.profileUrl);
    log(url.toString());
    var response = await client.put(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );
    log(jsonEncode(model));
    if (response.statusCode == 200) {
      log(response.body.toString());
      return true;
    } else {
      log(response.body.toString());
      return false;
    }
  }
}
