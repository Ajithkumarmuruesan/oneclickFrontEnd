import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:smart_website_creater/view/login/customWidgets/login_custom_widgets.dart';
import 'package:smart_website_creater/view/login/login_page_controller.dart';

class LoginPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        body: LoginPageWidgets().mobileLoginWidget(context),
      ));
    });
  }
}
