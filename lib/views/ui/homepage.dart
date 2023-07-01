import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_finder/constants/app_constants.dart';
import 'package:job_finder/controllers/exports.dart';
import 'package:job_finder/views/common/app_bar.dart';
import 'package:job_finder/views/common/app_style.dart';
import 'package:job_finder/views/common/heading_widget.dart';
import 'package:job_finder/views/common/height_spacer.dart';
import 'package:job_finder/views/common/search.dart';
import 'package:job_finder/views/common/vertical_shimmer.dart';
import 'package:job_finder/views/common/vertical_tile.dart';
import 'package:job_finder/views/ui/drawer/drawer_widget.dart';
import 'package:job_finder/views/ui/jobs/job_page.dart';
import 'package:job_finder/views/ui/jobs/widgets/horizontal_shimmer.dart';
import 'package:job_finder/views/ui/jobs/widgets/horizontal_tile.dart';
import 'package:job_finder/views/ui/search/searchpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(12.h),
                child: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
              ),
            ],
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: const DrawerWidget(),
            ),
          ),
        ),
        body: Consumer<JobsNotifier>(
          builder: (context, jobsNotifier, child) {
            jobsNotifier.getJobs();
            jobsNotifier.getRecentJobs();
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      const HeightSpacer(size: 10),
                      Text(
                        'Search \nFind & Apply',
                        style:
                            appstyle(40, Color(kDark.value), FontWeight.bold),
                      ),
                      const HeightSpacer(size: 10),
                      SearchWidget(
                        onTap: () {
                          Get.to(() => const SearchPage());
                        },
                      ),
                      const HeightSpacer(size: 30),
                      HeadingWidget(
                        text: 'Popular Jobs',
                        onTap: () {},
                      ),
                      const HeightSpacer(size: 15),
                      SizedBox(
                          height: hieght * 0.28,
                          child: FutureBuilder(
                              future: jobsNotifier.jobsList,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const HorizontalShimmer();
                                } else if (snapshot.hasError) {
                                  return Text('Error ${snapshot.error}');
                                } else {
                                  final jobs = snapshot.data;
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: jobs!.length,
                                      itemBuilder: (_, index) {
                                        return JobHorizontalTile(
                                          job: jobs[index],
                                          onTap: () {
                                            Get.to(
                                              () => JobPage(
                                                  id: '12',
                                                  title: jobs[index].company),
                                            );
                                          },
                                        );
                                      });
                                }
                              })),
                      const HeightSpacer(size: 20),
                      HeadingWidget(
                        text: 'Recently Posted',
                        onTap: () {},
                      ),
                      const HeightSpacer(size: 10),
                      FutureBuilder(
                          future: jobsNotifier.recentJobs,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const VerticalShimmer();
                            } else if (snapshot.hasError) {
                              return Text('Error ${snapshot.error}');
                            } else {
                              final jobs = snapshot.data;
                              return VerticalTile(
                                job: jobs!,
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
