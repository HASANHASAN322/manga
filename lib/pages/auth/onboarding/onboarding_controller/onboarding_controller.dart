import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find() ;

final pageController = PageController();
Rx<int> currentPageIndex = 0.obs ;
  //
  void updatePageIndicator(index) => currentPageIndex.value = index ;

  //
  void dotNavigationClock(index){
    currentPageIndex.value = index ;
    pageController.jumpTo(index);
  }

  //
  void nextPage(){
    if(currentPageIndex.value == 2){
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1 ;
      pageController.jumpToPage(page) ;
    }
  }




}