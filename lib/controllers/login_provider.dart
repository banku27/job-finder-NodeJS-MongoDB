import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../models/request/auth/login_model.dart';
import '../services/helpers/auth_helper.dart';
import '../views/ui/auth/update_user.dart';
import '../views/ui/mainscreen.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;
  final loginFormKey = GlobalKey<FormState>();
  bool get obscureText => _obscureText;
  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool _firstTime = true;
  bool get firstTime => _firstTime;
  set firstTime(bool newState) {
    _firstTime = newState;
    notifyListeners();
  }

  bool? _entrypoint;
  bool get entrypoint => _entrypoint ?? false;
  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  bool? _loggedIn;

  bool get loggedIn => _loggedIn ?? false;
  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    entrypoint = prefs.getBool('entrypoint') ?? false;
    loggedIn = prefs.getBool('loggedIn') ?? false;
  }

  bool validateAndSave() {
    final form = loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  userLogin(LoginModel model) {
    AuthHelper.login(model).then((response) {
      if (response && firstTime) {
        Get.off(() => const PersonalDetails());
      } else if (response && !firstTime) {
        Get.off(() => const MainScreen());
      } else if (!response) {
        Get.snackbar(
          'Sign Failed',
          'Please check your credentials',
          colorText: Color(kLight.value),
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
    });
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    await prefs.remove('token');
    _firstTime = false;
  }
}
