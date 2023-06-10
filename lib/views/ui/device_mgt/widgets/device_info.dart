import 'package:flutter/material.dart';
import 'package:job_finder/views/common/custom_outline_btn.dart';
import 'package:job_finder/views/common/exports.dart';
import 'package:job_finder/views/common/height_spacer.dart';

class DeviceInfo extends StatelessWidget {
  final String location;
  final String device;
  final String platform;
  final String date;
  final String ipAdress;

  const DeviceInfo(
      {super.key,
      required this.location,
      required this.device,
      required this.platform,
      required this.date,
      required this.ipAdress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: platform,
          style: appstyle(22, Color(kDark.value), FontWeight.bold),
        ),
        const HeightSpacer(size: 15),
        ReusableText(
          text: device,
          style: appstyle(22, Color(kDark.value), FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: date,
                  style: appstyle(16, Color(kDarkGrey.value), FontWeight.w400),
                ),
                ReusableText(
                  text: ipAdress,
                  style: appstyle(16, Color(kDarkGrey.value), FontWeight.w400),
                ),
              ],
            ),
            CustomOutlineBtn(
                width: width * 0.3,
                height: hieght * 0.05,
                text: 'Sign Out',
                color: Color(kOrange.value))
          ],
        )
      ],
    );
  }
}
