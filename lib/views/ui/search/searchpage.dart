import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:job_finder/constants/app_constants.dart';
import 'package:job_finder/models/response/jobs/jobs_response.dart';
import 'package:job_finder/services/helpers/jobs_helper.dart';
import 'package:job_finder/views/common/app_style.dart';
import 'package:job_finder/views/common/height_spacer.dart';
import 'package:job_finder/views/common/reusable_text.dart';
import 'package:job_finder/views/ui/jobs/widgets/job_tile.dart';
import 'package:job_finder/views/ui/search/widgets/custom_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        elevation: 0,
        title: CustomField(
          hintText: 'Search for a job',
          controller: search,
          onEditingComplete: () {
            setState(() {});
          },
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(AntDesign.search1),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(kLight.value),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: search.text.isNotEmpty
            ? FutureBuilder<List<JobsResponse>>(
                future: JobsHelper.searchJobs(search.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else if (snapshot.data!.isEmpty) {
                    return const SearchLoading(text: 'Job Not Found');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final jobs = snapshot.data;
                        return VerticalTileWidget(job: jobs![index]);
                      },
                    );
                  }
                })
            : const SearchLoading(text: 'Start searching for jobs'),
      ),
    );
  }
}

class SearchLoading extends StatelessWidget {
  const SearchLoading({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/optimized_search.png'),
          const HeightSpacer(size: 40),
          ReusableText(
            text: text,
            style: appstyle(24, Color(kDark.value), FontWeight.bold),
          )
        ],
      ),
    );
  }
}
