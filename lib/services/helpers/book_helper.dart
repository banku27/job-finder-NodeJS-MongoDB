import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:job_finder/models/request/bookmarks/bookmarks_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/bookmark_res.dart';
import '../config.dart';

class BookMarkHelper {
  static var client = https.Client();
  static Future<List<dynamic>> addBookmark(BookMarkReqResModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      "Content-Type": 'application/json',
      "token": "Bearer $token"
    };
    var url = Uri.https(Config.apiUrl, Config.bookmarkUrl);
    log(url.toString());
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 201) {
      log(response.body.toString());
      String bookmarkId = bookmarkReqResModelFromJson(response.body).id;
      return [true, bookmarkId];
    } else {
      log(response.body.toString());
      return [false];
      // log(response.body.toString());
      // throw Exception("failed to get the profile");
    }
  }
}
