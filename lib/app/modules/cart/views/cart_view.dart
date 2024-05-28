import 'package:cheapy/app/data/models/product_model.dart';
import 'package:cheapy/app/data/models/user_model.dart';
import 'package:cheapy/app/data/utils/constantApi.dart';
import 'package:cheapy/app/modules/cart/controllers/cart_controller.dart';
import 'package:cheapy/app/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find<ProductController>();
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.cartList.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartList.length,
                    itemBuilder: (context, index) {
                      Product product = controller.cartList[index];
                      return ListTile(
                        leading: Image.network(
                          Api.photoProduct + product.photo,
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.name),
                        subtitle: Text(
                            'Price: Rp.${product.sellingPrice.toString()}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            controller.removeFromCart(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: Get.height / 6,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Total: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Rp.${controller.totalPrice.toStringAsFixed(0)}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: () {
                              List<Map<String, dynamic>> details =
                                  controller.cartList.map((product) {
                                return {
                                  'product_id': product.id
                                }; // Mengambil ID produk dari daftar produk dalam keranjang
                              }).toList();

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  String? selectedBankAccount;
                                  List<Map<String, dynamic>> bankAccounts = [
                                    {
                                      'bankName': 'Mandiri',
                                      'accountNumber': '0123456789',
                                      'logoUrl':
                                          'https://e7.pngegg.com/pngimages/24/85/png-clipart-bank-mandiri-logo-credit-card-bank-text-logo.png',
                                    },
                                    {
                                      'bankName': 'BRI',
                                      'accountNumber': '9876543210',
                                      'logoUrl':
                                          'https://w7.pngwing.com/pngs/792/603/png-transparent-bank-bri-indonesia-indonesian-rakyat-banks-in-indonesia-logo-badge-icon-thumbnail.png',
                                    },
                                  ];

                                  return AlertDialog(
                                    title: Text('Check Out'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FutureBuilder<User>(
                                            future: cartController.fetchUsers(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                      ConnectionState.waiting ||
                                                  snapshot.data == null) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                    'Error fetching user data');
                                              } else {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('User Data:'),
                                                    SizedBox(height: 12),
                                                    Text(
                                                        'Name: ${snapshot.data!.name}'),
                                                    Text(
                                                        'Address: ${snapshot.data!.alamat}'),
                                                    Text(
                                                        'Phone: ${snapshot.data!.phone}'),
                                                  ],
                                                );
                                              }
                                            },
                                          ),
                                          SizedBox(height: 12),
                                          Text('Select Bank Account:'),
                                          SizedBox(height: 20),
                                          StatefulBuilder(
                                            builder: (BuildContext context,
                                                StateSetter setState) {
                                              return Column(
                                                children:
                                                    bankAccounts.map((bank) {
                                                  return ListTile(
                                                    title: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                                '${bank['accountNumber']} '),
                                                            Spacer(),
                                                          ],
                                                        ),
                                                        Text(
                                                            "(${bank['bankName']})"),
                                                        SizedBox(height: 8),
                                                        if (bank['logoUrl'] !=
                                                                null &&
                                                            bank['logoUrl']
                                                                .isNotEmpty)
                                                          Image.network(
                                                            bank['logoUrl'],
                                                            width: 40,
                                                            height: 40,
                                                          ),
                                                      ],
                                                    ),
                                                    leading: Radio<String>(
                                                      value:
                                                          '${bank['bankName']}',
                                                      groupValue:
                                                          selectedBankAccount,
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          selectedBankAccount =
                                                              value;
                                                        });
                                                      },
                                                      activeColor: Colors.red,
                                                    ),
                                                  );
                                                }).toList(),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () {
                                          cartController.storeTransaction(
                                            total:
                                                controller.totalPrice.toInt(),
                                            paymentMethod:
                                                '$selectedBankAccount',
                                            details: details,
                                          );
                                          controller.clearCart();

                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Checkout',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Checkout',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
