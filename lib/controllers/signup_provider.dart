import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/models/request/auth/signup_model.dart';
import 'package:job_finder/services/helpers/auth_helper.dart';
import 'package:job_finder/views/ui/auth/login.dart';

import '../constants/app_constants.dart';

class SignUpNotifier extends ChangeNotifier {
// trigger to hide and unhide the password
  bool _isObsecure = true;

  bool get isObsecure => _isObsecure;

  set isObsecure(bool obsecure) {
    _isObsecure = obsecure;
    notifyListeners();
  }

// triggered when the login button is clicked to show the loading widget
  bool _processing = false;
  bool get processing => _processing;

  set processing(bool newValue) {
    _processing = newValue;
    notifyListeners();
  }

// triggered when the fist time when user login to be prompted to the update profile page
  bool _firstTime = false;
  bool get firstTime => _firstTime;

  set firstTime(bool newValue) {
    _firstTime = newValue;
    notifyListeners();
  }

  final signupFormKey = GlobalKey<FormState>();

  bool passwordValidator(String password) {
    if (password.isEmpty) return false;
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  signUp(SignupModel model) {
    AuthHelper.signUp(model).then((response) {
      if (response) {
        Get.off(
          () => const LoginPage(),
          transition: Transition.fade,
          duration: const Duration(seconds: 2),
        );
        Get.snackbar(
          'User is registered',
          'login and enjoy your search for jobs',
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.add_alert),
        );
      } else {
        Get.snackbar(
          'Profile Updated',
          'Enjoy your search for jobs',
          colorText: Color(kLight.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.add_alert),
        );
      }
    });
  }
}
