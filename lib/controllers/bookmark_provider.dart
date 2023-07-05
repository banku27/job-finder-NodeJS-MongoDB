import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/models/request/bookmarks/all_bookmarks_model.dart';
import 'package:job_finder/models/request/bookmarks/bookmarks_model.dart';
import 'package:job_finder/services/helpers/book_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class BookMarkNotifier extends ChangeNotifier {
  List<String> _jobs = [];
  Future<List<AllBookmarks>>? bookmarks;

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

  Future<void> removeJob(String jobId) async {
    final prefs = await SharedPreferences.getInstance();

    _jobs.remove(jobId);
    prefs.setStringList('jobId', _jobs);
    notifyListeners();
  }

  Future<void> loadJob() async {
    final prefs = await SharedPreferences.getInstance();
    final jobs = prefs.getStringList('jobId');
    if (jobs != null) {
      _jobs = jobs;
      notifyListeners();
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

  deleteBookmark(String jobId) {
    BookMarkHelper.deleteBookmark(jobId).then((response) {
      if (response) {
        removeJob(jobId);
        Get.snackbar(
          'Bookmark Removed Successfully',
          'Please check your bookmarks',
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.bookmark_remove),
        );
      } else if (!response) {
        log(response.toString());
        Get.snackbar(
          'Failed to remove Bookmark',
          'Please try again',
          colorText: Color(kLight.value),
          backgroundColor: Colors.red,
          icon: const Icon(Icons.bookmark_add),
        );
      }
    });
  }

  getBookmarks() {
    bookmarks = BookMarkHelper.getAllBookmarks();
  }
}
