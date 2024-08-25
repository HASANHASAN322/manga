import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../home/controller/home_controller.dart';

class NewTermsPage extends StatelessWidget {
  const NewTermsPage({super.key});

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
              )),
          title: const Text(
            'فصول جديدة',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(MySize.myPadding),
              child: GridView.builder(
                itemCount: controller.story.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2 ,
                mainAxisExtent: 260 ,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: MySize.screenWidth * 0.05
                ),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 220,
                      width: MySize.screenWidth * 0.45,
                      child: Image(
                        image: AssetImage(controller.story[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      controller.story[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}


