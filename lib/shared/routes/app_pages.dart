import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_website_creater/view/completed/completed_page.dart';
import 'package:smart_website_creater/view/login/login_page_controller.dart';
import 'package:smart_website_creater/view/login/login_page_view.dart';
import 'package:smart_website_creater/view/register/register_page_view.dart';
import 'package:smart_website_creater/view/welcome/welcome_page_view.dart';

import '../../view/dashboard/dashboard_page_view.dart';

class AppPages with WidgetsBindingObserver {
  AppPages._();
  static const INITIAL = '/';

  static final routes = [
    GetPage(name: '/', page: () => WelcomePAgeView()),
    GetPage(name: '/login', page: () => LoginPageView()),
    GetPage(name: '/register', page: () => RegisterPageview()),
    GetPage(name: '/business', page: () => BusinessRegistrationScreen()),
    GetPage(name: '/complete', page: () => CompletedaPage()),
  ];
}
