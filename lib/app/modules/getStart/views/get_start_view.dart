import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/get_start_controller.dart';

class GetStartView extends GetView<GetStartController> {
  const GetStartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/logo.png",
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 4,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Selamat Datang di CheapyId!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Kami menyediakan Furniture dengan Kualitas"),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed("/login");
            },
            child: Text("Sign In"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.black, width: 2),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              minimumSize: Size(150, 50), // Minimum size of the button
              fixedSize: Size(250, 40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed("/register");
            },
            child: Text("Register", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              side: BorderSide(color: Colors.black, width: 2),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              minimumSize: Size(150, 50), // Minimum size of the button
              fixedSize: Size(250, 40),
            ),
          ),
        ],
      ),
    );
  }
}
