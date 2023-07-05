import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_finder/controllers/bookmark_provider.dart';
import 'package:job_finder/models/request/bookmarks/all_bookmarks_model.dart';
import 'package:job_finder/views/common/app_bar.dart';
import 'package:job_finder/views/ui/bookmarks/widgets/bookmark_widget.dart';
import 'package:job_finder/views/ui/drawer/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../jobs/widgets/horizontal_shimmer.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: 'BookMarks',
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: Consumer<BookMarkNotifier>(
        builder: (context, bookmarkNotifier, child) {
          bookmarkNotifier.getBookmarks();
          return FutureBuilder<List<AllBookmarks>>(
            future: bookmarkNotifier.bookmarks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const HorizontalShimmer();
              } else if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              } else {
                final book = snapshot.data;
                return ListView.builder(
                  itemCount: book!.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: BookmarkTile(
                        job: book[index].job,
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
