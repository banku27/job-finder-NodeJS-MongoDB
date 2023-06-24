import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_finder/controllers/exports.dart';
import 'package:job_finder/views/common/custom_btn.dart';
import 'package:job_finder/views/common/custom_textfield.dart';
import 'package:job_finder/views/common/exports.dart';
import 'package:job_finder/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController skill0 = TextEditingController();
  TextEditingController skill1 = TextEditingController();
  TextEditingController skill2 = TextEditingController();
  TextEditingController skill3 = TextEditingController();
  TextEditingController skill4 = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    location.dispose();
    skill0.dispose();
    skill1.dispose();
    skill2.dispose();
    skill3.dispose();
    skill4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, child) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: 'Personal Details',
                    style: appstyle(30, Color(kDark.value), FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Color(kLightBlue.value),
                      child: const Center(
                        child: Icon(Icons.photo_filter_rounded),
                      ),
                    ),
                  ),
                ],
              ),
              const HeightSpacer(size: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      hintText: 'Location',
                      keyboardType: TextInputType.text,
                      controller: location,
                      validator: (location) {
                        if (location!.isEmpty) {
                          return 'Please enter your location';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 15),
                    CustomTextField(
                      hintText: 'Phone',
                      keyboardType: TextInputType.phone,
                      controller: phone,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return 'Please enter your phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 15),
                    ReusableText(
                      text: 'Professional Skills',
                      style: appstyle(
                        30,
                        Color(kDark.value),
                        FontWeight.bold,
                      ),
                    ),
                    const HeightSpacer(size: 15),
                    CustomTextField(
                      hintText: 'Phone',
                      keyboardType: TextInputType.text,
                      controller: skill0,
                      validator: (skill0) {
                        if (skill0!.isEmpty) {
                          return 'Please enter your phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 15),
                    CustomTextField(
                      hintText: 'Phone',
                      keyboardType: TextInputType.text,
                      controller: skill1,
                      validator: (skill1) {
                        if (skill1!.isEmpty) {
                          return 'Please enter your phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 15),
                    CustomTextField(
                      hintText: 'Phone',
                      keyboardType: TextInputType.text,
                      controller: skill2,
                      validator: (skill2) {
                        if (skill2!.isEmpty) {
                          return 'Please enter your phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 15),
                    CustomTextField(
                      hintText: 'Phone',
                      keyboardType: TextInputType.text,
                      controller: skill3,
                      validator: (skill3) {
                        if (skill3!.isEmpty) {
                          return 'Please enter your phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 15),
                    CustomTextField(
                      hintText: 'Phone',
                      keyboardType: TextInputType.text,
                      controller: skill4,
                      validator: (skill4) {
                        if (skill4!.isEmpty) {
                          return 'Please enter your phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 20),
                    CustomButton(
                      onTap: () {},
                      text: 'Update Profile',
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
