import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_website_creater/view/login/login_page_controller.dart';

class WelcomePageController extends GetxController {
  var accesstoken;
  var email;
  var password;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getTokenInfo('');
    // email = getTokenInfo('email');
    // password = getTokenInfo('password');
  }

  // Future checkUser() async{
  //   try {
  //     if(accesstoken != ''){

  //     }

  //   } catch (e) {

  //   }
  // }

  started() async {
    await getTokenInfo('');
    try {
      if (accesstoken != null) {
        Get.offAllNamed('/business');
      } else {
        Get.toNamed('/login');
      }
      Get..find<LoginPageController>().assignValue();
    } catch (e) {}
  }

  Future<String> getTokenInfo(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accesstoken = await prefs.getString('access_token');
    email = await prefs.getString('email') ?? '';
    password = prefs.getString('password') ?? '';
    if (email != '' && email != 'null') {
      email = email;
      password = password;
    }
    if (accesstoken != '') {
      accesstoken = accesstoken;
    }
    return '';
  }
}
