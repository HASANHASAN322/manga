import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/models/story_model.dart';
import 'package:manga/pages/story_details/controller/controller.dart';
import 'package:manga/pages/story_details/widgets/story_disc.dart';
import 'package:manga/pages/story_details/widgets/story_image.dart';
import 'package:manga/pages/story_details/widgets/story_name.dart';
import 'package:manga/pages/story_details/widgets/story_team.dart';
import 'package:manga/pages/story_details/widgets/terms_widget.dart';
import 'package:manga/utils/constants/colors.dart';
import 'package:manga/utils/constants/size.dart';
import 'package:intl/intl.dart' as intl;

import '../library/widget/custom_tabbar_view.dart';

class StoryDetailsPage extends StatelessWidget {
  const StoryDetailsPage({super.key, required this.story});

  final StoryModel story;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoryDetailsController());
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// story image
                StoryImage(
                  image: story.image,
                  onUploadTap: () {},
                ),
                const SizedBox(
                  height: MySize.spaceBetweenItems,
                ),

                /// name & fav & class & date
                Padding(
                  padding: const EdgeInsets.all(MySize.myPadding),
                  child: Column(
                    children: [
                      /// name & fav
                      StoryName(
                        storyName: story.name,
                      ),
                      const SizedBox(
                        height: MySize.spaceBetweenItems,
                      ),

                      /// class
                      SizedBox(
                        height: 50,
                        width: MySize.screenWidth,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                                  width: MySize.screenWidth * 0.25,
                                  decoration: BoxDecoration(
                                      color:
                                          MyColors.grayColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      story
                                          .classification.classification[index],
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount:
                                story.classification.classification.length),
                      ),

                      /// Divider
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: MySize.spaceBetweenItems),
                        width: MySize.screenWidth,
                        height: 2,
                        color: MyColors.grayColor,
                      ),

                      /// date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'تاريخ النشر',
                            style: TextStyle(
                                fontSize: 18, color: MyColors.grayColor),
                          ),
                          Text(
                            intl.DateFormat('yyyy-MM-dd').format(DateTime(
                                story.date.year,
                                story.date.month,
                                story.date.day)),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: MySize.spaceBetweenItems,
                      ),

                      /// Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'التقييم',
                            style: TextStyle(
                                fontSize: 18, color: MyColors.grayColor),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.yellowAccent,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '${story.rating.toString()}/5',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),

                      /// Divider
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: MySize.spaceBetweenItems),
                        width: MySize.screenWidth,
                        height: 2,
                        color: MyColors.grayColor,
                      ),

                      DefaultTabController(
                        length: controller.tab.length,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.8,
                          padding: const EdgeInsets.all(MySize.myPadding),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            color: MyColors.bgColor,
                          ),
                          child: Column(
                            children: [
                              /// TabBar
                              TabBar(
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                indicatorColor: MyColors.mainColor,
                                labelColor: MyColors.mainColor,
                                unselectedLabelColor: MyColors.grayColor,
                                labelStyle: const TextStyle(fontSize: 16),
                                dividerColor: MyColors.bgColor,
                                tabs: controller.tab
                                    .map((String name) => Tab(
                                          text: name,
                                        ))
                                    .toList(),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),

                              /// Use CustomTabBarView
                              CustomTabBarView(
                                body: [
                                  const TermsWidget(),
                                  StoryDisc(
                                    storyDisc: story.desc,
                                  ),
                                  StoryTeam(story: story),
                                  const Text('',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MyColors.grayColor),
                                      overflow: TextOverflow.visible),
                                ],
                              ),

                              const SizedBox(
                                height: 16.0,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

