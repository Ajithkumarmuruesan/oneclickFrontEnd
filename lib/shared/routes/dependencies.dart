import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:smart_website_creater/view/dashboard/dashboard_page_controller.dart';
import 'package:smart_website_creater/view/login/login_page_controller.dart';
import 'package:smart_website_creater/view/register/register_page_controller.dart';
import 'package:smart_website_creater/view/welcome/welcome_page_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomePageController>(() => WelcomePageController());
    Get.put<LoginPageController>(LoginPageController());
    Get.put<RegisterPageController>(RegisterPageController());
    Get.put<DashboardViewController>(DashboardViewController());
  }
}
