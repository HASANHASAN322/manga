



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../controller/controller.dart';

class StoryName extends StatelessWidget {
  const StoryName({
    super.key, required this.storyName,
  });
  final String storyName ;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoryDetailsController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          storyName,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        Obx(
              ()=> CircleAvatar(
                radius: 25,
            backgroundColor: MyColors.grayColor.withOpacity(0.3),
            child: IconButton(
                onPressed: () => controller.addToFav(),
                icon: Icon(controller.isFav.value ? Icons.favorite: Icons.favorite_border ,
                  color:controller.isFav.value ?MyColors.mainColor: Colors.white, size: 30,)),
          ),
        )
      ],
    );
  }
}