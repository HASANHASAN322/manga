
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/auth/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:manga/pages/auth/onboarding/widgets/onboarding_next_button.dart';
import 'package:manga/pages/auth/onboarding/widgets/onboarding_page.dart';
import 'package:manga/utils/constants/text_string.dart';

import '../../../utils/constants/images_string.dart';
import 'onboarding_controller/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children:  const [
              OnBoardingPage(
                image: MyImages.onBoarding1,
                title: MyText.onBoardingText1,
                subTitle:MyText.onBoardingSubText1,
              ),
              OnBoardingPage(
                image: MyImages.onBoarding2,
                title:MyText.onBoardingText2,
                subTitle: MyText.onBoardingSubText2,
              ),
              OnBoardingPage(
                image: MyImages.onBoarding3,
                title: MyText.onBoardingText3,
                subTitle: MyText.onBoardingSubText3,
              ),
            ],
          ),
          /// dot navigation indicator
          const OnBoardingDotNavigation(),
          /// circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

