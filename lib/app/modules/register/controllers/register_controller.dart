import 'package:cheapy/app/data/utils/constantApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final alamatController = TextEditingController();
  final noTeleponController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clear() {
    usernameController.clear();
    alamatController.clear();
    noTeleponController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void increment() => count.value++;
  var isLoading = false.obs;

  void register() async {
    try {
      isLoading(true);

      var url = Uri.parse(Api.register);
      var response = await http.post(
        url,
        body: {
          'name': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'alamat': alamatController.text,
          'phone': noTeleponController.text,
        },
      );

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Registration successful',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white);

        clear();
      } else {
        Get.snackbar('Error', 'Periksa data anda atau gunakan email lainnya ',
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red);
      }
      print(response.body);
    } finally {
      isLoading(false);
    }
  }
}
