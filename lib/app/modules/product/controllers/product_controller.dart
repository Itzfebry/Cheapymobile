import 'package:cheapy/app/data/models/product_model.dart';
import 'package:cheapy/app/data/utils/constantApi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;
  var cartList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> refreshProducts() async {
    await fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(Api.product));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Product> products = [];
        for (var item in data['products']) {
          products.add(Product.fromJson(item));
        }
        productList.assignAll(products);
      } else {
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addToCart(Product product) {
    cartList.add(product);
    print(product.id);
    print('Product added to cart: ${product.name}');
  }

  void removeFromCart(Product product) {
    cartList.remove(product);
    print('Product removed from cart: ${product.name}');
  }

  void clearCart() {
    cartList.clear();
    print('Cart cleared');
  }

  double get totalPrice =>
      cartList.fold(0, (sum, item) => sum + item.sellingPrice);
}
