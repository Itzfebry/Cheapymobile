// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/login_controller.dart';

// class LoginView extends GetView<LoginController> {
//   const LoginView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     LoginController controller = Get.put(LoginController());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(''),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment
//               .start, // Align children to the start (left side)
//           crossAxisAlignment: CrossAxisAlignment
//               .start, // Align children to the start (left side)
//           children: [
//             Text(
//               "Sign In",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Silahkan melakukan Sign In",
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: controller.emailController,
//               decoration: InputDecoration(
//                 labelText: "Email",
//                 hintText: "Masukkan Email",
//                 hintStyle: TextStyle(
//                     color: Colors.grey), // Hint text color set to gray
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Colors.grey)), // Border color set to gray
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color:
//                             Colors.grey)), // Focused border color set to gray
//                 suffixIcon: Icon(Icons.email,
//                     color: Colors.grey), // Icon color set to gray
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: controller.passwordController,
//               decoration: InputDecoration(
//                 labelText: "Password",
//                 hintText: "Masukkan Password",
//                 hintStyle: TextStyle(
//                     color: Colors.grey), // Hint text color set to gray
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Colors.grey)), // Border color set to gray
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color:
//                             Colors.grey)), // Focused border color set to gray
//                 suffixIcon: Icon(Icons.lock,
//                     color: Colors.grey), // Icon color set to gray
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.end, // Align the InkWell to the right
//               children: [
//                 InkWell(
//                   onTap: () {
//                     controller.login();
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.black, width: 2.0),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.arrow_forward,
//                         size: 24.0,
//                         color:
//                             Colors.white, // Set the color of the icon to white
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Belum Mendaftar?",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () {
//                       Get.offAllNamed("/register");
//                     },
//                     child: Text(
//                       "Register",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
