import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smart_website_creater/model/login_model.dart';
import 'package:smart_website_creater/model/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:smart_website_creater/config/const.dart';
import 'package:smart_website_creater/model/user_registration_model.dart';
import 'package:smart_website_creater/view/login/login_page_controller.dart';

import '../model/buisness_registration_model.dart';

class Apiservice {
  Dio client = Dio();

  Future<bool> userRegistration(UserregistrationModel userregistrationModel) async {
    try {
      final response = await client.post(register,
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: jsonEncode(userregistrationModel));
      var responseData = response.data;
      return true;
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  Future<LoginResponseModel> login(LoginModel loginModel) async {
    try {
      final response = await client.post(loginUrl,
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: jsonEncode(loginModel));
      var responseData = response.data;
      final LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(responseData);
      return loginResponseModel;
    } catch (e) {
      print('Error during login: $e');
      return LoginResponseModel(token: '', username: '');
    }
  }
  //   try {
  //     final response = await http.post(Uri.parse(loginUrl),
  //         headers: {'Content-Type': 'application/json'},
  //         body: jsonEncode(loginModel));
  //     final Map<String, dynamic> responseData = jsonDecode(response.body);
  //     final LoginResponseModel loginResponseModel =
  //         LoginResponseModel.fromJson(responseData);
  //     return loginResponseModel;
  //   } catch (e) {
  //     return LoginResponseModel(token: '', username: '');
  //   }
  // }

  Future<bool> businessRegistration(var data) async {
    try {
      var accessToken = Get.find<LoginPageController>().accessToken;
      final response = await client.post(upload,
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json'
          }),
          data: data);
      var responseData = response.data;
      return true;
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }
}
