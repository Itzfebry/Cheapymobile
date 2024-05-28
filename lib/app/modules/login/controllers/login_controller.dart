import 'dart:convert';
import 'package:cheapy/app/data/utils/constantApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    try {
      isLoading(true);

      var url = Uri.parse(Api.login);
      var response = await http.post(
        url,
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var userData = responseBody['user'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('userId', userData['id']);

        Get.snackbar('Success', 'Login successful',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white);

        Get.offAllNamed('/bottom-nav');
      } else if (response.statusCode == 401) {
        Get.snackbar('Error', 'Password atau Email salah',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        Get.snackbar('Error', 'Failed to login',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
      print(response.body);
    } catch (e) {
      Get.snackbar('Error', 'Failed to login',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void printSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;

    print('User ID: $userId');
  }
}
