import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/home/widgets/new_story_widget/new_story_widget.dart';
import 'package:manga/utils/constants/colors.dart';
import 'package:manga/utils/constants/size.dart';
import '../home/controller/home_controller.dart';


class NewStories extends StatelessWidget {
  const NewStories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: AppBar(
          backgroundColor: MyColors.bgColor,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )) ,
          title: const Text('قصص جديدة' ,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 24),),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(MySize.myPadding) ,
            child: NewStoryWidget(count:controller.story.length ,),),
        ),
      ),
    );
  }
}
