import 'package:cheapy/app/modules/cart/views/cart_view.dart';
import 'package:cheapy/app/modules/home/views/home_view.dart';
import 'package:cheapy/app/modules/product/views/product_view.dart';
import 'package:cheapy/app/modules/profile/views/profile_view.dart';
import 'package:cheapy/app/modules/riwayat/views/riwayat_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> screens = [
    HomeView(), // Ganti dengan halaman Home yang Anda miliki
    ProductView(), // Ganti dengan halaman Product yang Anda miliki
    CartView(), // Ganti dengan halaman Cart yang Anda miliki
    RiwayatView(), // Ganti dengan halaman Riwayat yang Anda miliki
    ProfileView(), // Ganti dengan halaman Profile yang Anda miliki
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            selectedItemColor: Colors.black, // Warna ikon yang dipilih (hitam)
            unselectedItemColor:
                Colors.grey, // Warna ikon yang tidak dipilih (hitam)
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Product',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          )),
    );
  }
}
