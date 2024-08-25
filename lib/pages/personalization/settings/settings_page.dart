import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/auth/sign_up/sign_up.dart';
import 'package:manga/pages/home/widgets/drawer_widgets/setting_widgets.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../controller/controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController()) ;
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
            'الاعدادات',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MySize.myPadding),
            child: Column(
              children: [
                Container(
                  height: 35,
                  width: MySize.screenWidth,
                  padding: const EdgeInsets.symmetric(horizontal: MySize.myPadding),
                  child: const Text('اعدادات الحساب' , style: TextStyle(fontSize: 18 , color: Colors.white),),
                ) ,
                Container(
                  height: 1,
                  margin: const EdgeInsets.only(bottom: MySize.spaceBetweenItems),
                  width: MySize.screenWidth,
                  color: MyColors.grayColor,
                ) ,
                /// profile info
                SettingWidget(
                    onTap: ()=> Get.to(const SignUpScreen()),
                    icon: Icons.photo_camera_front_outlined,
                    title: 'تعديل معلومات الملف الشخصي'),
  /// profile info
                Obx(
                    ()=> Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SettingWidget(
                          onTap: () {},
                          icon: Icons.notifications_active,
                          title: 'تفعيل الاشعارات'),
                      Switch(
                        activeColor: MyColors.mainColor,
                          inactiveThumbColor: MyColors.grayColor,
                          value: controller.switchValue.value ,
                          onChanged:(val)=> controller.onSwitchChange())
                    ],
                  ),
                ),
                const SizedBox(height: MySize.spaceBetweenItems,) ,
                Container(
                  height: 35,
                  width: MySize.screenWidth,
                  padding: const EdgeInsets.symmetric(horizontal: MySize.myPadding),
                  child: const Text('اعدادات الحساب' , style: TextStyle(fontSize: 18 , color: Colors.white),),
                ) ,
                Container(
                  height: 1,
                  margin: const EdgeInsets.only(bottom: MySize.spaceBetweenItems),
                  width: MySize.screenWidth,
                  color: MyColors.grayColor,
                ) ,
  /// profile info
                SettingWidget(
                    onTap: () {},
                    icon: Icons.bug_report_outlined,
                    title: 'الابلاغ عن خلل'),

                /// edit pass
                SettingWidget(
                    onTap: () {},
                    icon: Icons.lock,
                    title: 'تعديل كلمة المرور'),

                /// delete my account
                SettingWidget(
                    onTap: () {},
                    icon: Icons.person_remove_alt_1,
                    title: 'حذف حسابي'),

                /// log out
                SettingWidget(
                    onTap: () {},
                    icon: Icons.logout_outlined,
                    title: 'تسجيل الخروج'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
