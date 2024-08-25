


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/utils/constants/colors.dart';

import '../../../utils/constants/size.dart';

class StoryImage extends StatelessWidget {
  const StoryImage({
    super.key, required this.image, required this.onUploadTap,
  });

  final String image ;
  final void Function() onUploadTap ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MySize.screenHeight * 0.5,
          width: MySize.screenWidth,
          child: Image(image: AssetImage(image) , fit: BoxFit.fill,),
        ),
        Positioned(
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: ()=> Get.back(), icon: const Icon(Icons.arrow_back_ios , size: 35 , color: MyColors.grayColor,)) ,
                  IconButton(onPressed: onUploadTap, icon: const Icon(Icons.upload , size: 35 , color: MyColors.grayColor,)) ,
                ],
              ),
            )) ,
      ],
    );
  }
}