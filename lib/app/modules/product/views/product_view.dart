import 'package:cheapy/app/data/models/product_model.dart';
import 'package:cheapy/app/data/utils/constantApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.productList.isEmpty) {
            return const Center(
              child: Text('No products available'),
            );
          } else {
            return RefreshIndicator(
              onRefresh: controller.refreshProducts,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    Product product = controller.productList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: Image.network(
                          Api.photoProduct + product.photo,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price: Rp.${product.sellingPrice.toString()}',
                            ),
                            Text(
                              'Stock: ${product.stock.toString()}',
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                                onPressed: () {
                                  controller.addToCart(product);
                                },
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                label: const Text('tambahkan',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
