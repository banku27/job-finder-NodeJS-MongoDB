import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/views/common/custom_outline_btn.dart';
import 'package:job_finder/views/common/exports.dart';
import 'package:job_finder/views/common/height_spacer.dart';
import 'package:job_finder/views/ui/auth/login.dart';
import 'package:job_finder/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: width,
      height: hieght,
      color: Color(kLightBlue.value),
      child: Column(children: [
        const HeightSpacer(size: 20),
        Image.asset('assets/images/page3.png'),
        const HeightSpacer(size: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ReusableText(
            text: 'Welcome To Job Finder',
            style: appstyle(30, Color(kLight.value), FontWeight.w600),
          ),
        ),
        const HeightSpacer(size: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomOutlineBtn(
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setBool('entrypoint', true);

                Get.to(() => const LoginPage());
              },
              text: 'Login',
              width: width * 0.4,
              height: hieght * 0.06,
              color: Color(kLight.value),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const RegistrationPage());
              },
              child: Container(
                width: width * 0.4,
                height: hieght * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(kLight.value),
                ),
                child: Center(
                  child: ReusableText(
                    text: 'Sign Up',
                    style:
                        appstyle(16, Color(kLightBlue.value), FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
        const HeightSpacer(size: 30),
        ReusableText(
          text: 'Continue as guest',
          style: appstyle(16, Color(kLight.value), FontWeight.w400),
        ),
      ]),
    ));
  }
}
