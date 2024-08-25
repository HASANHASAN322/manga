import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/pages/auth/sign_up/controller/signup_controller.dart';
import 'package:manga/utils/constants/colors.dart';
import 'package:manga/utils/constants/size.dart';

import '../../../bottom_nav_bar.dart';
import '../../../utils/enum/enum.dart';
import '../../../utils/sign_up_field/sign_up_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key,  this.isFirstTime = false});

  final bool isFirstTime ;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.bgColor.withOpacity(0.01),
          centerTitle: true,
          title:  Text( isFirstTime ?'اشتراك':
            'الملف الشخصي',
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        backgroundColor: MyColors.bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MySize.myPadding),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 0.5,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        height: MySize.screenHeight * 0.15),
                    items: controller.myImages.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100), // Set desired border radius
                            child: Image.asset(
                              i,
                              fit: BoxFit.cover,
                              width: 140,
                              height: 140,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ) ,


                  const SizedBox(
                    height: 15,
                  ),
                  ///
                  SignUpField(
                    controller: controller.userNameController,
                    title: 'إسم المستخدم',
                    validateText: 'يجب إدخال إسم المستخدم',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ///
                  Obx(()=> Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: RadioListTile<Sex>(
                          title: const Text('ذكر',
                            style:  TextStyle(color: MyColors.grayColor, fontSize: 18),),
                          value: Sex.male,
                          groupValue: controller.selectedSex.value,
                          onChanged: (value) => controller.changSex(value!),
                          activeColor: MyColors.mainColor,
                          shape: const UnderlineInputBorder(
                              borderSide: BorderSide(color: MyColors.grayColor)
                          ),
                        ),
                      ),
                      const Expanded(
                          flex: 1,
                          child: SizedBox(width: 6,)) ,
                      Expanded(
                        flex: 4,
                        child: RadioListTile<Sex>(
                          title: const Text('أنثى',
                            style:  TextStyle(color: MyColors.grayColor, fontSize: 18),),
                          value: Sex.female,
                          groupValue: controller.selectedSex.value,
                          onChanged: (value) => controller.changSex(value!),
                          activeColor: MyColors.mainColor,
                          shape: const UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.grayColor)
                          ),
                        ),
                      ),
                    ],
                  )),

                  const SizedBox(
                    height: 15,
                  ),
                  ///
                   SignUpField(
                    controller: controller.emailController,
                    title: 'البريد الالكتروني',
                    validateText: 'يجب إدخال البريد الالكتروني',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ///
                  isFirstTime ? const Row(
                    children: [
                      Text(
                        'كلمة المرور',
                        style: TextStyle(color: MyColors.grayColor, fontSize: 18),
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                        color: MyColors.mainColor,
                      )
                    ],
                  ) : const SizedBox(),
                  isFirstTime ? TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: MyColors.mainColor,
                    cursorHeight: 15,
                    controller: controller.passwordController,
                    validator: (text) {
                      if ( text!.isEmpty) {
                        return 'كلمة المرور لا يجب ان تكون فارغة !';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.dotColor)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                    ),
                  ) : const SizedBox() ,
                  isFirstTime ? const Row(
                    children: [
                      Text(
                        'تأكيد كلمة المرور',
                        style: TextStyle(color: MyColors.grayColor, fontSize: 18),
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                        color: MyColors.mainColor,
                      )
                    ],
                  ) : const SizedBox(),
                  isFirstTime ? TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: MyColors.mainColor,
                    cursorHeight: 15,
                    controller: controller.rePasswordController,
                    validator: (text) {
                      if ( text!.isEmpty) {
                        return 'كلمة المرور لا يجب ان تكون فارغة !';
                      } else if(controller.rePasswordController.text != controller.passwordController.text){
                        return 'يجب ادخال كلمة المرور نفسها!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.dotColor)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                    ),
                  ) : const SizedBox(),
                  const SizedBox(
                    height: 15,
                  ),
                  ///

                  const Text(
                    'الدولة',
                    style: TextStyle(color: MyColors.grayColor, fontSize: 18),
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: MyColors.mainColor,
                    cursorHeight: 15,
                    controller: controller.countryController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.dotColor)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.mainColor)),
                    ),
                    readOnly: true,
                    onTap: () => controller.showCountryPicker(context),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  ///
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: ()=> Get.offAll(const BottomNavBar()),
                      child:  Text( isFirstTime ?
                        'إبدأ القراءة' : 'حفظ',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

