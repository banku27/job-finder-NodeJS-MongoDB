import 'package:flutter/material.dart';
import 'package:job_finder/views/common/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onTap, required this.text, this.color});

  final VoidCallback onTap;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hieght * 0.065,
        width: width,
        color: Color(kOrange.value),
        child: Center(
          child: ReusableText(
              text: text,
              style:
                  appstyle(16, color ?? Color(kLight.value), FontWeight.w600)),
        ),
      ),
    );
  }
}
