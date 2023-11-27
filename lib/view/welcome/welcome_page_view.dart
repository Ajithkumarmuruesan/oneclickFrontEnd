import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_website_creater/shared/app_colors.dart';
import 'package:smart_website_creater/shared/app_strings.dart';
import 'package:smart_website_creater/shared/paint.dart';
import 'package:smart_website_creater/shared/screen_size.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:smart_website_creater/view/welcome/custom_widgets/custom_widgets.dart';
import 'package:smart_website_creater/view/welcome/welcome_page_controller.dart';

class WelcomePAgeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomePageController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: ElevatedButton(
            onPressed: () {
              controller.started();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              primary: themeColor,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            ),
            child: Text(AppStrings.startButton),
          ),
          body: CustomWidgets().mobileWidget(context),
        ),
      );
    });
  }
}
