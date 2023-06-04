import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_finder/controllers/exports.dart';
import 'package:job_finder/views/common/app_bar.dart';
import 'package:job_finder/views/common/custom_btn.dart';
import 'package:job_finder/views/common/custom_textfield.dart';
import 'package:job_finder/views/common/exports.dart';
import 'package:job_finder/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                text: 'Login',
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
                      text: 'Welcome Back!',
                      style: appstyle(30, Color(kDark.value), FontWeight.w600),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ReusableText(
                      text: 'Fill the details to login your account',
                      style:
                          appstyle(16, Color(kDarkGrey.value), FontWeight.w600),
                    ),
                  ),
                  const HeightSpacer(size: 50),
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
                    obscureText: loginNotifier.obscureText,
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Please enter your password";
                      }
                      if (password.length < 6) {
                        return "Password length should be atleast 6";
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginNotifier.obscureText = !loginNotifier.obscureText;
                      },
                      child: Icon(
                        loginNotifier.obscureText
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
                      onTap: () {},
                      child: ReusableText(
                          text: 'Register',
                          style: appstyle(
                              14, Color(kDark.value), FontWeight.w500)),
                    ),
                  ),
                  HeightSpacer(size: 50.h),
                  CustomButton(onTap: () {}, text: 'Login')
                ],
              ),
            ));
      },
    );
  }
}
