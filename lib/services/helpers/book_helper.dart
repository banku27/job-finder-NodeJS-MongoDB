import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:job_finder/models/request/bookmarks/all_bookmarks_model.dart';
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
      String bookmarkId = bookmarkReqResModelFromJson(response.body).id;
      log(response.body.toString());
      log(bookmarkId.toString());
      return [true, bookmarkId];
    } else {
      log(response.body.toString());
      return [false];
      // log(response.body.toString());
      // throw Exception("failed to get the profile");
    }
  }

  static Future<bool> deleteBookmark(String jobId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      "Content-Type": 'application/json',
      "token": "Bearer $token"
    };
    var url = Uri.https(Config.apiUrl, '${Config.bookmarkUrl}/$jobId');
    log(url.toString());
    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      log(response.body.toString());
      return true;
    } else {
      log(response.body.toString());
      return false;
      // log(response.body.toString());
      // throw Exception("failed to get the profile");
    }
  }

  static Future<List<AllBookmarks>> getAllBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      "Content-Type": 'application/json',
      "token": "Bearer $token"
    };
    var url = Uri.https(Config.apiUrl, Config.bookmarkUrl);
    log(url.toString());
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      log(response.body.toString());
      var bookmarks = allBookmarksFromJson(response.body);
      return bookmarks;
    } else {
      log(response.body.toString());
      throw Exception('Failed to load bookmarks.');
      // log(response.body.toString());
      // throw Exception("failed to get the profile");
    }
  }
}
