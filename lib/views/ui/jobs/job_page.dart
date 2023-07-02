import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:job_finder/constants/app_constants.dart';
import 'package:job_finder/controllers/exports.dart';
import 'package:job_finder/views/common/app_bar.dart';
import 'package:job_finder/views/common/app_style.dart';
import 'package:job_finder/views/common/custom_outline_btn.dart';
import 'package:job_finder/views/common/height_spacer.dart';
import 'package:job_finder/views/common/reusable_text.dart';
import 'package:provider/provider.dart';

class JobPage extends StatefulWidget {
  final String title;
  final String id;
  const JobPage({super.key, required this.title, required this.id});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobNotifier, child) {
        jobNotifier.getJob(widget.id);
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: CustomAppBar(
                text: widget.title,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: const Icon(Entypo.bookmark),
                  )
                ],
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(CupertinoIcons.arrow_left),
                ),
              ),
            ),
            body: FutureBuilder(
                future: jobNotifier.job,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else {
                    final job = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Stack(
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              const HeightSpacer(size: 30),
                              Container(
                                height: hieght * 0.27,
                                width: width,
                                color: Color(kLightGrey.value),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(job!.imageUrl),
                                    ),
                                    const HeightSpacer(size: 10),
                                    ReusableText(
                                      text: job.title,
                                      style: appstyle(22, Color(kDark.value),
                                          FontWeight.w600),
                                    ),
                                    const HeightSpacer(size: 5),
                                    ReusableText(
                                      text: job.location,
                                      style: appstyle(
                                          16,
                                          Color(kDarkGrey.value),
                                          FontWeight.w600),
                                    ),
                                    const HeightSpacer(size: 15),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomOutlineBtn(
                                            width: width * 0.26,
                                            height: hieght * 0.04,
                                            text: 'Full-Time',
                                            color2: Color(kLight.value),
                                            color: Color(kOrange.value),
                                          ),
                                          Row(
                                            children: [
                                              ReusableText(
                                                  text: '10k',
                                                  style: appstyle(
                                                      22,
                                                      Color(kDark.value),
                                                      FontWeight.w600)),
                                              SizedBox(
                                                width: width * 0.2,
                                                child: ReusableText(
                                                    text: '/monthly',
                                                    style: appstyle(
                                                        22,
                                                        Color(kDark.value),
                                                        FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const HeightSpacer(size: 20),
                              ReusableText(
                                  text: 'Job Description',
                                  style: appstyle(
                                      22, Color(kDark.value), FontWeight.w600)),
                              const HeightSpacer(size: 10),
                              Text(
                                desc,
                                textAlign: TextAlign.justify,
                                maxLines: 8,
                                style: appstyle(16, Color(kDarkGrey.value),
                                    FontWeight.normal),
                              ),
                              const HeightSpacer(size: 20),
                              ReusableText(
                                text: 'Requirements',
                                style: appstyle(
                                    22, Color(kDark.value), FontWeight.w600),
                              ),
                              const HeightSpacer(size: 10),
                              SizedBox(
                                height: hieght * 0.6,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: requirements.length,
                                  itemBuilder: (context, index) {
                                    String bullet = "\u2022";
                                    final req = requirements[index];
                                    return Text(
                                      "$bullet $req\n",
                                      maxLines: 4,
                                      textAlign: TextAlign.justify,
                                      style: appstyle(
                                          16,
                                          Color(kDarkGrey.value),
                                          FontWeight.normal),
                                    );
                                  },
                                ),
                              ),
                              const HeightSpacer(size: 20),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: CustomOutlineBtn(
                                  onTap: () {},
                                  width: width,
                                  height: hieght * 0.06,
                                  text: 'Apply Now',
                                  color: Color(kLight.value),
                                  color2: Color(kOrange.value)),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }));
      },
    );
  }
}
