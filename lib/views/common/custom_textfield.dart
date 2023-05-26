import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_constants.dart';
import 'package:job_finder/views/common/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.obscureText,
      required this.controller});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(kLightGrey.value),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: appstyle(14, Color(kDarkGrey.value), FontWeight.w500),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
            borderRadius: BorderRadius.zero,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(kDarkGrey.value),
              width: 0.5,
            ),
            borderRadius: BorderRadius.zero,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.5,
            ),
            borderRadius: BorderRadius.zero,
          ),
          border: InputBorder.none,
        ),
        controller: controller,
        cursorHeight: 25,
        style: appstyle(14, Color(kDark.value), FontWeight.w500),
        validator: validator,
      ),
    );
  }
}
