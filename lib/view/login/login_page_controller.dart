import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_website_creater/model/login_model.dart';
import 'package:smart_website_creater/model/login_response_model.dart';
import 'package:smart_website_creater/sevices/apiservices.dart';
import 'package:smart_website_creater/view/welcome/welcome_page_controller.dart';

class LoginPageController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var obscurePassword = true;
  bool rememberMe = false;
  bool isTextBoxClicked = false;
  late FocusNode focusNode;
  LoginModel? loginModel;
  var accessToken;
  final FirebaseAuth auth = FirebaseAuth.instance;
  LoginResponseModel? loginResponseModel;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await assignValue();
  }

  Future assignValue() async {
    String email = Get.find<WelcomePageController>().email ?? '';
    String password = Get.find<WelcomePageController>().password ?? '';
    if (email != '' && password != '') {
      userNameController.text = email;
      passwordController.text = password;
      rememberMe = true;
    }
  }

  RxBool isSignedIn = false.obs;

  Future<void> signInWithGoogle() async {
    await signOut();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User user = userCredential.user!;
      final String userId = user.uid;
      final String email = user.email!;
      final String userName = user.displayName ?? '';
      userNameController.text = email;
      passwordController.text = userId;

      await login();
      userNameController.clear();
      passwordController.clear();

      final List<String> googleAccounts = await GoogleSignIn()
          .onCurrentUserChanged
          .map((GoogleSignInAccount? account) => [account?.email ?? ''])
          .first;

      if (googleAccounts.length > 1) {
        print('Choose your Google account:');
        for (int i = 0; i < googleAccounts.length; i++) {
          print('$i: ${googleAccounts[i]}');
        }

        int selectedAccountIndex = 0;

        print('Selected account: ${googleAccounts[selectedAccountIndex]}');
      }
    } catch (e) {
      // Handle authentication error
      print('Error signing in with Google: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  passwordView() {
    obscurePassword = !obscurePassword;
    update();
  }

  checkliew() {
    rememberMe = !rememberMe;
    update();
  }

  focasChange(value) {
    isTextBoxClicked = value;
    update();
  }

  Future<bool> setTokenInfo(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    return true;
  }

  Future login() async {
    try {
      final res = await Apiservice().login(LoginModel(
          username: userNameController.text,
          password: passwordController.text));
      loginResponseModel = res;
      if (loginResponseModel!.token != '') {
        accessToken = loginResponseModel!.token;

        if (rememberMe) {
          setTokenInfo('email', userNameController.text);
          setTokenInfo('password', passwordController.text);
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          setTokenInfo('access_token', loginResponseModel!.token.toString());
        }
        Get.find<WelcomePageController>().getTokenInfo('');
        EasyLoading.dismiss();
        // loginSucessfully();
        Get.offAllNamed('/business');
      }
    } catch (e) {}
  }

  Future loginSucessfully() async {
    try {
      Future.delayed(Duration(seconds: 2), () {
        Get.toNamed('/business');
      });
    } catch (e) {}
  }
}
