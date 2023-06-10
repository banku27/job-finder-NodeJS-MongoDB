import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_finder/constants/app_constants.dart';
import 'package:job_finder/controllers/exports.dart';
import 'package:job_finder/views/common/app_style.dart';
import 'package:job_finder/views/common/height_spacer.dart';
import 'package:job_finder/views/common/reusable_text.dart';
import 'package:job_finder/views/ui/device_mgt/widgets/device_info.dart';
import 'package:job_finder/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

import '../../common/app_bar.dart';
import '../drawer/drawer_widget.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().toString();
    var loginDate = date.substring(0, 11);
    var zoomNotifer = Provider.of<ZoomNotifier>(context);
    var onboardNotifier = Provider.of<OnBoardNotifier>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'Device Management',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(size: 50),
                Text(
                  'You are logged in into your account on these devices',
                  style: appstyle(16, Color(kDark.value), FontWeight.normal),
                ),
                const HeightSpacer(size: 50),
                DeviceInfo(
                    location: 'Ahmedabad',
                    device: 'OnePlus Nord 2',
                    platform: 'Android',
                    date: loginDate,
                    ipAdress: '192.18.18.22'),
                const HeightSpacer(size: 50),
                DeviceInfo(
                    location: 'Vadodara',
                    device: 'MacBook M2',
                    platform: 'Apple Kit',
                    date: loginDate,
                    ipAdress: '192.18.18.22')
              ],
            ),
          ),
          Consumer<LoginNotifier>(
            builder: (context, loginNotifier, child) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    zoomNotifer.currentIndex = 0;
                    onboardNotifier.isLastPage = false;
                    Get.to(
                      () => const OnBoardingScreen(),
                    );
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ReusableText(
                        text: 'Sign Out of all devices',
                        style: appstyle(
                            17, Color(kOrange.value), FontWeight.w600)),
                  ),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
