

import 'package:get/get.dart';

class SettingController extends GetxController{


  final RxBool switchValue = false.obs ;

   onSwitchChange(){
    switchValue.value = !switchValue.value ;
    update() ;
  }
}