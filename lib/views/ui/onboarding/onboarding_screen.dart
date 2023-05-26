import 'package:flutter/material.dart';
import 'package:job_finder/controllers/exports.dart';
import 'package:job_finder/views/ui/onboarding/widgets/page_one.dart';
import 'package:job_finder/views/ui/onboarding/widgets/page_three.dart';
import 'package:job_finder/views/ui/onboarding/widgets/page_two.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<OnBoardNotifier>(
      builder: (context, onBoardNotifier, child) {
        return Stack(
          children: [
            PageView(
              physics: onBoardNotifier.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              onPageChanged: (page) {
                // ignore: avoid_print
                print(page);
                onBoardNotifier.isLastPage = page == 2;
              },
              children: const [
                PageOne(),
                PageTwo(),
                PageThree(),
              ],
            )
          ],
        );
      },
    ));
  }
}
