import 'dart:convert';
import 'package:cheapy/app/data/utils/constantApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cheapy/app/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  final count = 0.obs;
  late User user;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<User> fetchUsers() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('userId') ?? 0;
      var response = await http.get(Uri.parse(Api.user + userId.toString()));
      if (response.statusCode == 200) {
        var userData = jsonDecode(response.body);
        User user = User.fromJson(userData);
        return user;
      } else if (response.statusCode == 404) {
        print('User not found');
        throw Exception(
            'User not found'); // Throw exception untuk menangani kesalahan
      } else {
        print('Failed to load user data: ${response.statusCode}');
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      throw Exception('Error fetching user data');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> storeTransaction({
    required int total,
    required String paymentMethod,
    required List<Map<String, dynamic>> details,
  }) async {
    isLoading(true);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('userId') ?? 0;
      final response = await http.post(
        Uri.parse(Api.transaction),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
          'total': total,
          'payment_method': paymentMethod,
          'status': 'Belum Bayar',
          'details': details,
        }),
      );

      if (response.statusCode == 201) {
        final transaction = jsonDecode(response.body);
        print('Transaction created successfully: $transaction');
        Get.snackbar(
          'Success',
          'Transaction created successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
        );
      } else {
        final error = jsonDecode(response.body);
        throw Exception(
          'Failed to create transaction: $error',
        );
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'Failed to create transaction',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading(false);
    }
  }
}
