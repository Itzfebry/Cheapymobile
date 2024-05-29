import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Buat akun Anda",
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Masukkan Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  suffixIcon: Icon(Icons.person, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.alamatController,
                decoration: InputDecoration(
                  labelText: "Alamat",
                  hintText: "Masukkan Alamat",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  suffixIcon: Icon(Icons.person, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.noTeleponController,
                decoration: InputDecoration(
                  labelText: "No. Telepon",
                  hintText: "Masukkan No. Telepon",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  suffixIcon: Icon(Icons.phone, color: Colors.grey),
                ),
                keyboardType:
                    TextInputType.number, // Set keyboard type to numeric
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Masukkan Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  suffixIcon: Icon(Icons.email, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Masukkan Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  suffixIcon: Icon(Icons.lock, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      controller.register();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Already have an account?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.offAllNamed("/login");
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
