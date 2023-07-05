import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/models/request/bookmarks/bookmarks_model.dart';
import 'package:job_finder/services/helpers/book_helper.dart';

import '../constants/app_constants.dart';

class BookMarkNotifier extends ChangeNotifier {
  addBookmark(BookMarkReqResModel model, String jobId) {
    BookMarkHelper.addBookmark(model).then((response) {
      if (response[0]) {
        Get.snackbar(
          'Bookmark Successfully Added',
          'Please check your bookmarks',
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.bookmark_add),
        );
      }
    });
  }
}
