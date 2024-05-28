import 'dart:convert';

import 'package:cheapy/app/data/models/user_model.dart';
import 'package:cheapy/app/data/utils/constantApi.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  late Rx<User?> user = Rx<User?>(null);
  var isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUsers();
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

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('userId') ?? 0;
      var response = await http.get(Uri.parse(Api.user + userId.toString()));
      if (response.statusCode == 200) {
        var userData = jsonDecode(response.body);
        user.value = User.fromJson(
            userData); // Inisialisasi nilai user setelah mendapatkan data
      } else if (response.statusCode == 404) {
        print('User not found');
        throw Exception('User not found');
      } else {
        print('Failed to load user data: ${response.statusCode}');
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      throw Exception('Error fetching user data');
    } finally {
      isLoading(false);
    }
  }
}
