


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/size.dart';
import '../../../classification_details/classification_details.dart';
import '../../controller/home_controller.dart';

class StoryClassification extends StatelessWidget {
  const StoryClassification({
    super.key,  this.count = 4,
  });

  final int count ;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 65),
        itemCount: count,
        itemBuilder: (context, index) => InkWell(
          onTap: ()=> Get.to(ClassificationDetails(className: controller.storyClasses[index],)),
          child: Container(
            height: 65,
            width: MySize.screenWidth * 0.4,
            color: Colors.blueGrey,
            child:  Center(
              child: Text(
               controller.storyClasses[index],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ));
  }
}