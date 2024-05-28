import 'dart:convert';

import 'package:cheapy/app/data/models/riwayat_model.dart';
import 'package:cheapy/app/data/utils/constantApi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatController extends GetxController {
  var riwayatList = <Riwayat>[].obs;
  var isLoading = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchRiwayat();
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
  Future<void> fetchRiwayat() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('userId') ?? 0;
      isLoading(true);
      var response = await http.post(
        Uri.parse(Api.riwayat), // Ganti dengan URL API yang sesuai
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'user_id': userId}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        List<Riwayat> riwayat =
            data.map((json) => Riwayat.fromJson(json)).toList();
        riwayatList.assignAll(riwayat);
      } else {
        print('Failed to load riwayat: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching riwayat: $e');
    } finally {
      isLoading(false);
    }
  }
}
