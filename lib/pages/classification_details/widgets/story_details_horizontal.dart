


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../story_details/story_details_page.dart';
import '../controller/classification_controller.dart';

class StoryDetailsHorizontal extends StatelessWidget {
  const StoryDetailsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassificationController());
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: ()=> Get.to(StoryDetailsPage(story: controller.story[index],)),
          child: Container(
            height: 120,
            width: MySize.screenWidth,
            color:
            MyColors.grayColor.withOpacity(0.1),
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  width: MySize.screenWidth * 0.2,
                  child: Image(
                    image: AssetImage(controller
                        .story[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: MySize.screenWidth * 0.04,
                ),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.story[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16),
                    ),
                    Text(
                      intl.DateFormat('yyyy-MM-dd')
                          .format(DateTime(
                          controller
                              .story[index]
                              .date
                              .year,
                          controller
                              .story[index]
                              .date
                              .month,
                          controller
                              .story[index]
                              .date
                              .day)),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color:
                          Colors.yellowAccent,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${controller.story[index].rating.toString()}/5',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width:
                  MySize.screenWidth * 0.25,
                ),
                Obx(
                      () => CircleAvatar(
                    radius: 20,
                    backgroundColor: MyColors
                        .grayColor
                        .withOpacity(0.2),
                    child: IconButton(
                        onPressed: () =>
                            controller.addToFav(),
                        icon: Icon(
                          controller.isFav.value
                              ? Icons.favorite
                              : Icons
                              .favorite_border,
                          color: controller
                              .isFav.value
                              ? MyColors.mainColor
                              : Colors.white,
                          size: 20,
                        )),
                  ),
                ),
                SizedBox(
                  width: MySize.screenWidth * 0.04,
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) =>
        const SizedBox(
          height: MySize.spaceBetweenItems,
        ),
        itemCount: controller.story.length);
  }
}