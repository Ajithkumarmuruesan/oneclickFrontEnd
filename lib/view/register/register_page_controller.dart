import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_website_creater/model/user_registration_model.dart';
import 'package:smart_website_creater/sevices/apiservices.dart';

class RegisterPageController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey1 = GlobalKey<FormState>();
  var obscurePassword = true;

  passwordView() {
    obscurePassword = !obscurePassword;
    update();
  }

  Future registeration(BuildContext context) async {
    try {
      final response = await Apiservice().userRegistration(
          UserregistrationModel(
              name: userNameController.text,
              username: emailController.text,
              password: passwordController.text));
      if (response) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration Successfully Pls Login'),
        ));
        Get.back();
        userNameController.clear();
        emailController.clear();
        passwordController.clear();
      }
      return true;
    } catch (e) {}
  }

  Future<void> signInWithGoogle(BuildContext context) async {
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
      userNameController.text = userName;
      emailController.text = email;
      passwordController.text = userId;

      await registeration(context);

      print('User ID: $userId');
      print('User Name: $userName');

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
}
