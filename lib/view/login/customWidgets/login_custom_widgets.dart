import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smart_website_creater/shared/app_colors.dart';
import 'package:smart_website_creater/shared/screen_size.dart';
import 'package:smart_website_creater/view/login/login_page_controller.dart';

class LoginPageWidgets {
  Widget mobileLoginWidget(BuildContext context) {
    return GetBuilder<LoginPageController>(builder: (controller) {
      return SingleChildScrollView(
        child: Container(
          color: themeColor,
          child: Column(
            children: [
              Container(
                height: Screen.height(context) / 2.3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fsignin.png?alt=media&token=ee8d84e8-fb08-4b1e-960a-aa1c8dbdd4ba'),
                ),
              ),
              Container(
                // height: Screen.height(context) / 1.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: themeColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            // autofocus: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value!.isEmpty ? 'Please Enter Email' : null,
                            controller: controller.userNameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              labelText: 'Email',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            // autofocus: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value!.isEmpty ? 'Please Enter Password' : null,
                            controller: controller.passwordController,
                            obscureText: controller.obscurePassword,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              labelText: 'Password',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: controller.rememberMe,
                              onChanged: (value) {
                                controller.checkliew();
                              },
                            ),
                            Text('Remember Me'),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                print('Forgot Password tapped');
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              EasyLoading.instance
                                ..displayDuration =
                                    const Duration(milliseconds: 1500)
                                ..loadingStyle = EasyLoadingStyle.light
                                ..indicatorType = EasyLoadingIndicatorType.wave
                                ..maskType = EasyLoadingMaskType.clear
                                ..userInteractions = false;

                              if (controller.formKey.currentState!.validate()) {
                                EasyLoading.show();
                                await controller.login();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              primary: themeColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: Screen.width(context) / 3),
                              elevation: 5.0,
                            ),
                            child: Text('SUBMIT'),
                          ),
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
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 5, bottom: 5),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Login with',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                InkWell(

                                  onTap: ()async{
                                    await controller.signInWithGoogle();
                                  },
                                  child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGicon.png?alt=media&token=77bcfaa4-662d-4503-8a0a-f31adadc9b57',
                                    height: 20,
                                  ),
                                ),
                                Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FFicon.png?alt=media&token=01d5ecea-1d57-4058-b958-db340ebb877f',
                                  height: 20,
                                ),
                                Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FLicon.png?alt=media&token=456aa250-b8d1-4fb0-8fa1-cddc636a7e1d',
                                  height: 20,
                                ),
                                Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FTicon.png?alt=media&token=9ea17275-989d-48c4-b982-5a1cb9866135',
                                  height: 20,
                                )
                              ],
                            ),
                          ),
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
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            // controller: controller.passwordController,
                            // obscureText: controller.obscurePassword,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              suffixIcon: Container(
                                child: Center(
                                    child: Text(
                                  'Request OTP',
                                  style: TextStyle(color: Colors.grey),
                                )),
                                width: Screen.width(context) / 3,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              labelText: 'Mobile Number',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: Screen.width(context) / 8),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed('/register');
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        'Sign UP',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                                    width: Screen.width(context) / 4,
                                    decoration: BoxDecoration(
                                        color: themeColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
