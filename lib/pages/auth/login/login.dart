import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga/bottom_nav_bar.dart';
import 'package:manga/pages/auth/login/controller/login_controller.dart';
import 'package:manga/pages/auth/sign_up/sign_up.dart';
import 'package:manga/utils/constants/size.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/social_btn/social_btn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: MyColors.bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(MySize.myPadding),
            child: Obx(() => Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),

                    /// app logo
                    SizedBox(
                      height: MySize.screenHeight * 0.20,
                      width: MySize.screenWidth,
                      child: const Image(image: AssetImage(MyImages.appLogo)),
                    ),
                    const SizedBox(
                      height: 60,
                    ),

                    /// login as guest
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                              onPressed: ()=> Get.to(const BottomNavBar()),
                            child: const Text(
                              'واصل كضيف',
                              style: TextStyle(
                                  fontSize: 15, color: MyColors.mainColor),
                            ))
                      ],
                    ),

                    /// login form
                    Form(
                        child: Column(
                      children: [
                        /// email form
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: MyColors.mainColor,
                          cursorHeight: 15,
                          controller: controller.emailController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'يجب ادخال البريد الالكتروني';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: 'البريد الالكتروني',
                              hintStyle: TextStyle(color: MyColors.dotColor , fontSize: 18),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.dotColor)
                              ),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.mainColor)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.mainColor)
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.mainColor)
                              ),
                              ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        /// password form
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          cursorHeight: 15,
                          controller: controller.passwordController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'كلمة المرور لا يجب ان تكون فارغة !';
                            }
                            return null;
                          },
                          obscureText: controller.obscureText.value,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              labelStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              hintText: 'كلمة المرور',
                              hintStyle: const TextStyle(color: MyColors.dotColor , fontSize: 18),
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.dotColor)
                              ),
                              errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.mainColor)
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.mainColor)
                              ),
                              focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: MyColors.mainColor)
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.obscureText.value =
                                      !controller.obscureText.value;
                                },
                                color: Colors.grey,
                                icon: Icon(controller.obscureText.value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        /// Forget pass
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'هل نسيت كلمة المرور ؟',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        /// sign in btn
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
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
                    )),

                    /// OR
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '- أو سجل دخول عبر -',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    /// social btn
                    SocialBtn(
                      image: MyImages.google,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// dont have account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'لا تملك حساب ؟',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                            onPressed: () =>Get.to(const SignUpScreen()),
                            child: const Text(
                              'سجل الان من هنا',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.mainColor),
                            ))
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    ));
  }
}
