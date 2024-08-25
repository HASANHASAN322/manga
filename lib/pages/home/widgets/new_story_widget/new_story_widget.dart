


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/story_details/story_details_page.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../controller/home_controller.dart';

class NewStoryWidget extends StatelessWidget {
  const NewStoryWidget({
    super.key,  this.count = 4,
  });

  final int count ;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 ,
            mainAxisSpacing: 20 ,
            crossAxisSpacing: 10,
            mainAxisExtent: 210
        ),
        itemCount: count,
        itemBuilder: (context , index)=>  InkWell(
          onTap: ()=>Get.to(StoryDetailsPage(story: controller.story[index],)),
          child: SizedBox(
            width: MySize.screenWidth * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: MySize.screenWidth * 0.4,
                    width: MySize.screenWidth * 0.45,
                    child:  Image(image: AssetImage( controller.story[index].image) , fit: BoxFit.fill,)) ,
                Text(controller.story[index].name , style: const TextStyle(color: Colors.white , fontSize: 16),) ,
                Text(controller.story[index].classification.classification.join(' ,'), style: const TextStyle(color: MyColors.grayColor , fontSize: 13),)
              ],
            ),
          ),
        )
    );
  }
}
