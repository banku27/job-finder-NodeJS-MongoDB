import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:job_finder/models/request/auth/login_model.dart';
import 'package:job_finder/services/config.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {"Content-Type": 'application/josn'};

    var url = Uri.https(Config.apiUrl, Config.loginUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
