


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../controller/home_controller.dart';

class ComingStory extends StatelessWidget {
  const ComingStory({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SizedBox(
      height: 300,
      width: MySize.screenWidth,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220,
                width: MySize.screenWidth,
                child: Image(
                  image:
                  AssetImage(controller.story[index].image),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: MySize.myPadding),
                width: MySize.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      children: [
                        Text(
                          controller.story[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w300),
                        ),
                          Text(
                              controller.story[index].classification.classification.join(' ,'),
                            style: const TextStyle(
                                color: MyColors.grayColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                      ],
                    ),
                    Obx(
                          () => IconButton(
                          onPressed: () =>
                          controller.notifyMe.value =
                          !controller.notifyMe.value,
                          icon: controller.notifyMe.value
                              ? const Icon(
                            Icons.notifications_active , size: 45, color: MyColors.mainColor,)
                              : const Icon(Icons.notifications , size: 45, color: MyColors.grayColor)),
                    )
                  ],
                ),
              )
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
          itemCount: 4),
    );
  }
}