import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../onboarding_controller/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance ;
    return Positioned(
        bottom: MySize.myPadding * 2,
        right: MySize.myPadding,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClock,
          count: 3,
          effect: const ExpandingDotsEffect(
              activeDotColor: Colors.white70,
              dotColor: MyColors.dotColor,
              dotHeight: 6),
        ));
  }
}
