import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smart_website_creater/shared/app_colors.dart';
import 'package:smart_website_creater/shared/screen_size.dart';
import 'package:smart_website_creater/view/register/register_page_controller.dart';

class RegisterPageWidgets {
  Widget mobileRegisterWidget(BuildContext context) {
    return GetBuilder<RegisterPageController>(builder: (controller) {
      return SingleChildScrollView(
        child: Container(
          color: themeColor,
          child: Form(
            key: controller.formKey1,
            child: Column(
              children: [
                Container(
                  //  height: Screen.height(context) / 2.3,
                  width: Screen.width(context),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  height: Screen.height(context) / 2.2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fsignup.png?alt=media&token=c09e67aa-d7f9-4b6f-8195-8cde196f9a93'),
                  ),
                ),
                Container(
                    width: Screen.width(context),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    // height: Screen.height(context) / ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value!.isEmpty ? 'Please Enter Name' : null,
                    controller: controller.userNameController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      labelText: 'Name',
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value!.isEmpty ? 'Please Enter Email' : null,
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value!.isEmpty ? 'Please Enter Password' : null,
                    controller: controller.passwordController,
                    obscureText: controller.obscurePassword,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      suffixIcon: IconButton(
                        icon: Icon(
                          !controller.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.passwordView();
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      EasyLoading.instance
                        ..displayDuration = const Duration(milliseconds: 1500)
                        ..loadingStyle = EasyLoadingStyle.light
                        ..indicatorType = EasyLoadingIndicatorType.wave
                        ..maskType = EasyLoadingMaskType.clear
                        ..userInteractions = false;

                      if (controller.formKey1.currentState!.validate()) {
                        EasyLoading.show();
                        await controller.registeration(context);
                        EasyLoading.dismiss();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      primary: roundShapeColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: Screen.width(context) / 4),
                      elevation: 5.0,
                    ),
                    child: Text('CREATE ACCOUNT'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.0,
                        width: Screen.width(context) / 2.5,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('or'),
                      SizedBox(width: 8),
                      Container(
                        height: 1.0,
                        width: Screen.width(context) / 2.5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign Up with',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () async {
                            await controller.signInWithGoogle(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              // color: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGicon.png?alt=media&token=77bcfaa4-662d-4503-8a0a-f31adadc9b57',
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FFicon.png?alt=media&token=01d5ecea-1d57-4058-b958-db340ebb877f',
                            height: 20,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FLicon.png?alt=media&token=456aa250-b8d1-4fb0-8fa1-cddc636a7e1d',
                            height: 20,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FTicon.png?alt=media&token=9ea17275-989d-48c4-b982-5a1cb9866135',
                            height: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: Screen.width(context) / 8),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Sign in',
                                style: TextStyle(color: themeColor),
                              ),
                            )),
                            width: Screen.width(context) / 4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
