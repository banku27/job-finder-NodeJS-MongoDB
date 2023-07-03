import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:job_finder/models/response/jobs/jobs_response.dart';
import 'package:job_finder/views/common/exports.dart';
import 'package:job_finder/views/common/width_spacer.dart';
import 'package:job_finder/views/ui/jobs/job_page.dart';

class VerticalTile extends StatelessWidget {
  final void Function()? onTap;
  final JobsResponse job;
  const VerticalTile({super.key, this.onTap, required this.job});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(
            () => JobPage(title: job.company, id: job.id),
          );
        },
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
                                20.sp, Color(kDark.value), FontWeight.w600),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            child: ReusableText(
                              text: job.title,
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
                      text: job.salary,
                      style: appstyle(23, Color(kDark.value), FontWeight.w600),
                    ),
                    ReusableText(
                      text: '/${job.period}',
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
