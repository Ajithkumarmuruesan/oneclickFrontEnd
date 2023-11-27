import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smart_website_creater/shared/app_colors.dart';
import 'package:smart_website_creater/shared/screen_size.dart';

class CompletedaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                themeColor.withOpacity(0.6),
                Colors.white.withOpacity(0.5),
                Colors.white,
                Colors.white,
                Colors.white
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fcomplete.png?alt=media&token=6d442c4f-7d07-43a3-8c3d-b38c13caa464'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'CONGRATS!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'YOU COMPLETED THE PROCESS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text('your Buisness Website URL:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 1500)
                      ..loadingStyle = EasyLoadingStyle.light
                      ..indicatorType = EasyLoadingIndicatorType.wave
                      ..maskType = EasyLoadingMaskType.clear
                      ..userInteractions = false;
                    EasyLoading.show();
                    Get.offAllNamed('/business');
                    // await controller.buisnessRegistration();
                    EasyLoading.dismiss();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    primary: themeColor.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(
                        vertical: 5, horizontal: Screen.width(context) / 8),
                    elevation: 5.0,
                  ),
                  child: Text('DASHBOARD'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 1500)
                      ..loadingStyle = EasyLoadingStyle.light
                      ..indicatorType = EasyLoadingIndicatorType.wave
                      ..maskType = EasyLoadingMaskType.clear
                      ..userInteractions = false;
                    EasyLoading.show();
                    Get.offAllNamed('/login');
                    // buisnessRegistration();
                    EasyLoading.dismiss();
                    // Get.toNamed('/complete');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    primary: themeColor,
                    padding: EdgeInsets.symmetric(
                        vertical: 5, horizontal: Screen.width(context) / 7),
                    elevation: 5.0,
                  ),
                  child: Text('WEBSITE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
