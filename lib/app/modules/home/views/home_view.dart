// import 'package:cheapy/app/modules/components/sliderbestus.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CheapyId',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25)),
//         leading: Image.asset(
//           'assets/logo.png', // Ubah sesuai dengan path gambar Anda
//           width: 150, // Ubah ukuran gambar sesuai kebutuhan
//           height: 150,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: Get.height / 3,
//                 width: Get.width,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(
//                       20), // Mengatur sudut yang dibulatkan
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.5), // Warna bayangan
//                       spreadRadius: 3, // Menyebar radius bayangan
//                       blurRadius: 7, // Radius blur bayangan
//                       offset: const Offset(0, 3), // Offset bayangan (x, y)
//                     ),
//                   ],
//                 ),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Image.asset(
//                       'assets/gambar1.jpeg', // Ganti dengan path gambar Anda
//                       fit: BoxFit.cover, // Mengisi gambar ke dalam container
//                     ),
//                     // Tambahkan konten lain di sini
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Row(
//                 children: [
//                   Text(
//                     "Best of Us",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Spacer(),
//                   Text(
//                     "Tampilkan Semua",
//                     style: TextStyle(fontSize: 18, color: Colors.grey),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     ProductCard(
//                       imagePath: "assets/KursiSahrini.png",
//                       category: "Modern",
//                       title: "Kursi Sharini",
//                       price: "Rp. 2.900.000",
//                     ),
//                     SizedBox(width: 20),
//                     ProductCard(
//                       imagePath: "assets/elitespringbed.png",
//                       category: "Modern",
//                       title: "Elite Spring Bed",
//                       price: "Rp. 3.255.000",
//                     ),
//                     SizedBox(width: 20),
//                     ProductCard(
//                       imagePath: "assets/Keameja.png",
//                       category: "Modern",
//                       title: "Kea Meja",
//                       price: "Rp. 2.900.000",
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "New Product",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: Get.height / 3,
//                 width: Get.width,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(
//                       20), // Mengatur sudut yang dibulatkan
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.5), // Warna bayangan
//                       spreadRadius: 3, // Menyebar radius bayangan
//                       blurRadius: 7, // Radius blur bayangan
//                       offset: const Offset(0, 3), // Offset bayangan (x, y)
//                     ),
//                   ],
//                 ),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Image.asset(
//                       'assets/Sofaputih.png', // Ganti dengan path gambar Anda
//                       fit: BoxFit.cover, // Mengisi gambar ke dalam container
//                     ),
//                     // Tambahkan konten lain di sini
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
