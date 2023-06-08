import 'package:flutter/material.dart';
import 'package:job_finder/views/common/app_style.dart';
import 'package:job_finder/views/common/reusable_text.dart';

import '../../constants/app_constants.dart';

class HeadingWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const HeadingWidget({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
          text: text,
          style: appstyle(20, Color(kDark.value), FontWeight.w600),
        ),
        GestureDetector(
          onTap: onTap,
          child: ReusableText(
            text: 'View all',
            style: appstyle(18, Color(kOrange.value), FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
