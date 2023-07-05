import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/models/request/bookmarks/bookmarks_model.dart';
import 'package:job_finder/services/helpers/book_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class BookMarkNotifier extends ChangeNotifier {
  List<String> _jobs = [];

  List<String> get jobs => _jobs;

  set jobs(List<String> newJobList) {
    _jobs = newJobList;
    notifyListeners();
  }

  Future<void> addJob(String jobId) async {
    final prefs = await SharedPreferences.getInstance();

    _jobs.insert(0, jobId);
    prefs.setStringList('jobId', _jobs);
    notifyListeners();
  }

  Future<void> loadJob() async {
    final prefs = await SharedPreferences.getInstance();
    final jobs = prefs.getStringList('jobId');
    if (jobs != null) {
      _jobs = jobs;
    }
  }

  addBookmark(BookMarkReqResModel model, String jobId) {
    BookMarkHelper.addBookmark(model).then((response) {
      if (response[0]) {
        addJob(jobId);
        Get.snackbar(
          'Bookmark Successfully Added',
          'Please check your bookmarks',
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.bookmark_add),
        );
      } else if (!response[0]) {
        log(response.toString());
        Get.snackbar(
          'Failed to add Bookmark',
          'Please try again',
          colorText: Color(kLight.value),
          backgroundColor: Colors.red,
          icon: const Icon(Icons.bookmark_add),
        );
      }
    });
  }
}
