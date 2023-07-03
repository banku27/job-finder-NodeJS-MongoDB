import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:job_finder/models/response/jobs/jobs_response.dart';
import 'package:job_finder/views/common/exports.dart';
import 'package:job_finder/views/common/width_spacer.dart';
import 'package:job_finder/views/ui/jobs/job_page.dart';

class VerticalTileWidget extends StatelessWidget {
  const VerticalTileWidget({super.key, required this.job});
  final JobsResponse job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () {
          Get.to(() => JobPage(title: job.company, id: job.id));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          height: hieght * 0.15,
          width: width,
          color: Color(kLightGrey.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(job.imageUrl),
                      ),
                      const WidthSpacer(size: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: job.company,
                            style: appstyle(
                                20, Color(kDark.value), FontWeight.w600),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            child: ReusableText(
                              text: job.title,
                              style: appstyle(
                                  20, Color(kDarkGrey.value), FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const WidthSpacer(size: 15),
                      CircleAvatar(
                        radius: 18,
                        child: Icon(
                          Ionicons.chevron_forward,
                          color: Color(kOrange.value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 75.w),
                child: Row(
                  children: [
                    ReusableText(
                        text: job.salary,
                        style:
                            appstyle(18, Color(kDark.value), FontWeight.w600)),
                    ReusableText(
                        text: '/${job.period}',
                        style:
                            appstyle(18, Color(kDark.value), FontWeight.w600))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
