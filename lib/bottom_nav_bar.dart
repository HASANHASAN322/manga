import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/home/home.dart';
import 'package:manga/pages/library/library.dart';
import 'package:manga/pages/search/search.dart';
import 'package:manga/utils/constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Obx(
              () => controller.screens[controller.selectedIndex.value],
        ),
        bottomNavigationBar:Container(
            color: Colors.black.withOpacity(0.7),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(Icons.home, 0, controller),
                buildNavItem(Icons.content_paste_search, 1, controller),
                buildNavItem(Icons.local_library, 2, controller),
              ],
            ),
          ),
        ),
    );
  }

  Widget buildNavItem(IconData icon, int index, NavigationController controller) {
    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: Obx(
            () => Icon(
          icon,
          size: 30,
          color: controller.selectedIndex.value == index
              ? MyColors.mainColor
              : MyColors.grayColor,
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const Home(), const Search(), const Library()];
}
