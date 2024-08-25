import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/library/widget/custom_tabbar_view.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import 'controller/library_controller.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LibraryController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'المكتبة',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyColors.grayColor),
          ),
          backgroundColor: MyColors.bgColor,
        ),
        body: DefaultTabController(
          length: controller.tab.length,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(MySize.myPadding),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: MyColors.bgColor,
            ),
            child: Column(
              children: [
                /// TabBar
                TabBar(
                 labelPadding: const EdgeInsets.symmetric(horizontal: 5),
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
                CustomTabBarView( body: controller.body,),

                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
