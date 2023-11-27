import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_website_creater/shared/app_colors.dart';
import 'package:smart_website_creater/shared/app_strings.dart';
import 'package:smart_website_creater/shared/screen_size.dart';

class CustomWidgets {
  Widget mobileWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [themeColor, Colors.white],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              top: Screen.height(context) / 35,
              right: Screen.width(context) / 10,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fwhitelogo.png?alt=media&token=969e3202-ad65-48b1-9b32-77cb8ccb8704',
                fit: BoxFit.contain,
                height: Screen.height(context) / 12,
              ),
            ),
            Positioned(
              top: 0,
              right: !kIsWeb
                  ? Screen.width(context) / 2
                  : Screen.width(context) / 4,
              child: Container(
                width: Screen.width(context) / 1.5,
                height: Screen.height(context) / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: roundShapeColor,
                ),
              ),
            ),
            Positioned(
              top: Screen.height(context) / 9,
              child: Container(
                width: Screen.height(context) / 2,
                height: Screen.height(context) / 2.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      roundShapeColor,
                      roundShapeColor,
                      roundShapeColor.withOpacity(0.3),
                      Colors.white.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.desc1,
                        style: TextStyle(color: Colors.white, fontSize: 60),
                      ),
                      Text(
                        AppStrings.desc2,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        AppStrings.desc3,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        AppStrings.desc4,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fsplash.png?alt=media&token=7042bd08-7868-4536-9e8b-6938c62c1fbd',
                fit: BoxFit.contain,
                height: Screen.height(context) / 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
