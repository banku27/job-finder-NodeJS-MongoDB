import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_finder/controllers/exports.dart';
import 'package:job_finder/views/common/custom_btn.dart';
import 'package:job_finder/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

import '../../common/app_bar.dart';
import '../../common/custom_textfield.dart';
import '../../common/exports.dart';
import '../../common/height_spacer.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(
      builder: (context, signupNotifier, child) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                text: 'Sign Up',
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(CupertinoIcons.arrow_left),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const HeightSpacer(size: 50),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ReusableText(
                      text: 'Hello, Welcome!',
                      style: appstyle(30, Color(kDark.value), FontWeight.w600),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ReusableText(
                      text: 'Fill the details to signup for an account',
                      style:
                          appstyle(16, Color(kDarkGrey.value), FontWeight.w600),
                    ),
                  ),
                  const HeightSpacer(size: 50),
                  CustomTextField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    hintText: 'Full Name',
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Please enter your name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                    validator: (email) {
                      if (email!.isEmpty || !email.contains('@')) {
                        return "Please enter valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: password,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Password',
                    obscureText: signupNotifier.isObsecure,
                    validator: (password) {
                      if (signupNotifier.passwordValidator(password ?? '')) {
                        return 'Please enter a valid password with atleast one uppercase, one lowercase, one digit, a special character and length atleast 8';
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        signupNotifier.isObsecure = !signupNotifier.isObsecure;
                      },
                      child: Icon(
                        signupNotifier.isObsecure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(kDark.value),
                      ),
                    ),
                  ),
                  HeightSpacer(size: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginPage());
                      },
                      child: ReusableText(
                          text: 'Login',
                          style: appstyle(
                              14, Color(kDark.value), FontWeight.w500)),
                    ),
                  ),
                  HeightSpacer(size: 50.h),
                  CustomButton(onTap: () {}, text: 'Sign Up')
                ],
              ),
            ));
      },
    );
  }
}
