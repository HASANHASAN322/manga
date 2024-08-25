import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/home/controller/home_controller.dart';
import 'package:manga/pages/home/widgets/coming_story/coming_story.dart';
import 'package:manga/pages/home/widgets/drawer_widgets/setting_widgets.dart';
import 'package:manga/pages/home/widgets/new_story_Terms/new_story_terms.dart';
import 'package:manga/pages/home/widgets/new_story_widget/new_story_widget.dart';
import 'package:manga/pages/home/widgets/story_classification/story_classification.dart';
import 'package:manga/pages/personalization/settings/settings_page.dart';
import 'package:manga/utils/constants/colors.dart';
import 'package:manga/utils/constants/images_string.dart';
import 'package:manga/utils/constants/size.dart';
import '../../utils/header_widget/header_widget.dart';
import '../all_classification_page/classification_page.dart';
import '../new_stories_page/new_stories.dart';
import '../new_terms_page/new_terms_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: controller.scaffoldKey,
        drawer: Drawer(
          backgroundColor: MyColors.bgColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: MySize.spaceBetweenItems*3,) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: ()=> Get.back(), icon: const Icon(Icons.close , color: MyColors.grayColor,size: 30,)),
                  ],
                ) ,
                const SizedBox(height: MySize.spaceBetweenItems,) ,
                CircleAvatar(
                  radius: MySize.screenWidth * 0.20,
                  backgroundColor: MyColors.bgColor,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(MyImages.profile))),
                ) ,
                const SizedBox(height: MySize.spaceBetweenItems,) ,
                const Text('اسم المستخدم' , style: TextStyle(color: Colors.white , fontSize: 18),) ,
                const SizedBox(height: MySize.spaceBetweenItems *2,) ,
                 /// setting
                 SettingWidget(onTap: ()=> Get.to(const SettingsPage()),title: 'الاعدادات',icon: Icons.settings,) ,
                 /// About
                 SettingWidget(onTap: (){},title: 'حول التطبيق',icon: Icons.info_outline,) ,
                 /// connect with us
                 SettingWidget(onTap: (){},title: 'تواصل معنا',icon: Icons.message_outlined,) ,
                 /// term of use
                 SettingWidget(onTap: (){},title: 'شروط الاستخدام',icon: Icons.library_books_rounded,) ,
                 /// privacy
                 SettingWidget(onTap: (){},title: 'سياسة الخصوصية',icon: Icons.privacy_tip_outlined,) ,

              ],
            ),
          ),
        ),
        backgroundColor: MyColors.bgColor,
        body: SingleChildScrollView(
          child: Stack(
             children: [
               Column(
                 children: [
                   /// slider
                   SizedBox(
                     height: MySize.screenHeight * 0.40,
                     width: MySize.screenWidth,
                     child: CarouselSlider(
                       options: CarouselOptions(
                         viewportFraction: 1,
                         onPageChanged: (index, _) =>
                             controller.updatePageIndicator(index),
                         height: MySize.screenHeight * 0.40,
                       ),
                       items: controller.banners
                           .map((url) => SizedBox(
                           width: MySize.screenWidth,
                           child: Image(
                             image: AssetImage(url),
                             fit: BoxFit.fill,
                           )))
                           .toList(),
                     ),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   Center(
                     child: Obx(() => Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         for (int i = 0; i < controller.banners.length; i++)
                           Container(
                             width: controller.currentIndex.value == i ? 20 : 8,
                             height: 4,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               color: controller.currentIndex.value == i
                                   ? Colors.white70
                                   : MyColors.dotColor,
                             ),
                             margin: const EdgeInsets.only(right: 10),
                           )
                       ],
                     )),
                   ),

                   Padding(
                     padding: const EdgeInsets.all(MySize.myPadding),
                     child: Column(
                       children: [
                         /// new story header
                         HeaderWidget(label: 'قصص جديدة', onTap: ()=> Get.to(const NewStories())),
                         const NewStoryWidget(),
                         const SizedBox(
                           height: MySize.spaceBetweenItems,
                         ),

                         /// classification
                         HeaderWidget(
                           label: 'التصنيفات',
                           onTap: () => Get.to(const ClassificationPage()),
                         ),
                         const StoryClassification(),
                         const SizedBox(
                           height: MySize.spaceBetweenItems,
                         ),

                         /// New terms
                         HeaderWidget(
                           label: 'فصول جديدة',
                           /// edit her
                           onTap: () => Get.to(const NewTermsPage()),
                         ),
                         NewStoryTerms(story: controller.story,),
                         const SizedBox(
                           height: MySize.spaceBetweenItems,
                         ),
                         /// Coming Story
                         const HeaderWidget(
                           label: 'قصص قادمة',
                           showBtn: false,
                         ),
                         const ComingStory() ,
                         const SizedBox(
                           height: MySize.spaceBetweenItems,
                         ),
                       ],
                     ),
                   )
                 ],
               ) ,
               Positioned(
                 top: 5,
                 right: 10,
                 child: SafeArea(
                   child: CircleAvatar(
                     radius: 25,
                     backgroundColor: MyColors
                         .grayColor
                         .withOpacity(0.5),
                     child: IconButton(
                         onPressed: () => controller.openDrawer(),
                         icon: const Icon(
                           Icons.person_2_outlined,
                           color: Colors.white,
                           size: 35,
                         )),
                   ),
                 ),
               ) ,
             ],
          ),
        ),
      ),
    );
  }
}


