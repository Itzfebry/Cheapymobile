class Product {
  final int id;
  final String? productCode;
  final String photo;
  final String name;
  final int sellingPrice;
  final int? purchasePrice;
  final int stock;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.photo,
    required this.name,
    required this.sellingPrice,
    required this.stock,
    this.productCode,
    this.purchasePrice,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productCode: json['product_code'],
      photo: json['photo'],
      name: json['name'],
      sellingPrice: json['selling_price'],
      purchasePrice: json['purchase_price'],
      stock: json['stock'],
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
