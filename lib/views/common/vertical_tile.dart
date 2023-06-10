import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:job_finder/views/common/exports.dart';
import 'package:job_finder/views/common/width_spacer.dart';

class VerticalTile extends StatelessWidget {
  final void Function()? onTap;
  const VerticalTile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          height: hieght * 0.15,
          width: width,
          color: Color(kLightGrey.value),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Color(kLightGrey.value),
                        backgroundImage:
                            const AssetImage('assets/images/slack.png'),
                      ),
                      const WidthSpacer(size: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: 'Slack',
                            style: appstyle(
                                20.sp, Color(kDark.value), FontWeight.w600),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            child: ReusableText(
                              text: 'Django/Py Developer ',
                              style: appstyle(18.sp, Color(kDarkGrey.value),
                                  FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 18.r,
                        backgroundColor: Color(kLight.value),
                        child: const Icon(Ionicons.chevron_forward),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Row(
                  children: [
                    ReusableText(
                      text: '20k',
                      style: appstyle(23, Color(kDark.value), FontWeight.w600),
                    ),
                    ReusableText(
                      text: '/monthly',
                      style:
                          appstyle(18, Color(kDarkGrey.value), FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
