import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/classification_details/controller/classification_controller.dart';
import 'package:manga/pages/classification_details/widgets/story_details_horizontal.dart';
import 'package:manga/utils/constants/size.dart';
import 'package:manga/utils/header_widget/header_widget.dart';
import '../../utils/constants/colors.dart';
import '../home/widgets/new_story_Terms/new_story_terms.dart';
import '../library/widget/custom_tabbar_view.dart';

class ClassificationDetails extends StatelessWidget {
  const ClassificationDetails({super.key, required this.className});

  final String className;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassificationController());
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: MyColors.bgColor,
          appBar: AppBar(
            backgroundColor: MyColors.bgColor,
            centerTitle: true,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            title: Text(className,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(MySize.myPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HeaderWidget(
                    label: 'الأعلى تقييما',
                    showBtn: false,
                  ),
                  NewStoryTerms(
                    count: 3,
                    story: controller.story,
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
                          const CustomTabBarView(
                            body: [
                              StoryDetailsHorizontal() ,
                              StoryDetailsHorizontal() ,
                              StoryDetailsHorizontal() ,
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
            ),
          ),
        ));
  }
}


