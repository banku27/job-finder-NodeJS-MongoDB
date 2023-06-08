import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:job_finder/constants/app_constants.dart';
import 'package:job_finder/controllers/exports.dart';
import 'package:job_finder/views/common/app_style.dart';
import 'package:job_finder/views/common/width_spacer.dart';
import 'package:job_finder/views/ui/auth/profile.dart';
import 'package:job_finder/views/ui/bookmarks/bookmarks.dart';
import 'package:job_finder/views/ui/chat/chatpage.dart';
import 'package:job_finder/views/ui/device_mgt/devices_info.dart';
import 'package:job_finder/views/ui/drawer/drawer_screen.dart';
import 'package:job_finder/views/ui/homepage.dart';
import 'package:provider/provider.dart';

import '../common/reusable_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return ZoomDrawer(
          menuScreen: DrawerScreen(
            indexSetter: (index) {
              zoomNotifier.currentIndex = index;
            },
          ),
          mainScreen: currentScreen(),
          borderRadius: 30,
          angle: 0.0,
          showShadow: true,
          slideWidth: 250,
          menuBackgroundColor: Color(kLightBlue.value),
        );
      },
    );
  }

  Widget currentScreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatsPage();
      case 2:
        return const BookMarkPage();
      case 3:
        return const DeviceManagement();
      case 4:
        return const ProfilePage();

      default:
        return const HomePage();
    }
  }

  Widget drawerItem(IconData icon, String text, int index, Color color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const WidthSpacer(
              size: 12,
            ),
            ReusableText(
                text: text,
                style: appstyle(
                  12,
                  color,
                  FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
}
