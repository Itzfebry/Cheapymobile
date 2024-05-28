// import 'package:cheapy/app/data/models/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/profile_controller.dart';

// class ProfileView extends GetView<ProfileController> {
//   const ProfileView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ProfileController profileController = Get.put(ProfileController());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Image.asset(
//               "assets/logo.png",
//               width: Get.width / 2,
//               height: Get.height / 4,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Obx(
//               () {
//                 if (profileController.isLoading.value) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (profileController.user.value == null) {
//                   return Center(child: Text('Failed to load user data'));
//                 } else {
//                   User user = profileController.user.value!;
//                   return Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               'Name:',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               width: Get.width / 4,
//                             ),
//                             Text('${user.name}',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold)),
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Text(
//                               'Email:',
//                               style: TextStyle(fontSize: 14),
//                             ),
//                             SizedBox(
//                               width: Get.width / 4,
//                             ),
//                             Text(
//                               '${user.email}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                               ),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Text(
//                               'Alamat:',
//                               style: TextStyle(fontSize: 14),
//                             ),
//                             SizedBox(
//                               width: Get.width / 4,
//                             ),
//                             Text(
//                               '${user.alamat}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                               ),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Text(
//                               'Phone:',
//                               style: TextStyle(fontSize: 14),
//                             ),
//                             SizedBox(
//                               width: Get.width / 4,
//                             ),
//                             Text(
//                               '${user.phone}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                               ),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.left,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
