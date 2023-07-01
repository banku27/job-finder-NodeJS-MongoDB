import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:job_finder/models/response/jobs/jobs_response.dart';

import '../config.dart';

class JobsHelper {
  static var client = https.Client();

  static Future<List<JobsResponse>> getJobs() async {
    Map<String, String> requestHeaders = {
      "Content-Type": 'application/json',
    };
    var url = Uri.https(Config.apiUrl, Config.jobs);
    log(url.toString());
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      log(response.body.toString());
      var jobList = jobsResponseFromJson(response.body);
      return jobList;
    } else {
      log(response.body.toString());
      throw Exception("failed to get the jobs");
    }
  }

  static Future<JobsResponse> getRecentJobs() async {
    Map<String, String> requestHeaders = {
      "Content-Type": 'application/json',
    };
    var url = Uri.https(Config.apiUrl, Config.jobs);
    log(url.toString());
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      log(response.body.toString());
      var jobList = jobsResponseFromJson(response.body);

      var recent = jobList.first;
      return recent;
    } else {
      log(response.body.toString());
      throw Exception("failed to get the jobs");
    }
  }
}
