import 'package:flutter/material.dart';
import 'package:manga/utils/constants/colors.dart';

import '../../../../utils/constants/size.dart';
import '../onboarding_controller/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left:  MySize.myPadding,
        bottom: MySize.myPadding,
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
         style: ElevatedButton.styleFrom(
             shape: const CircleBorder(),
             minimumSize: const Size(50, 50),
             backgroundColor: MyColors.dotColor),
          child: const Icon(Icons.keyboard_arrow_left_outlined , color: Colors.white,),

        ));
  }
}
