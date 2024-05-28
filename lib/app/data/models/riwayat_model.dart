class Riwayat {
  final String transactionCode;
  final int userId;
  final int total;
  final String paymentMethod;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Riwayat({
    required this.transactionCode,
    required this.userId,
    required this.total,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Riwayat.fromJson(Map<String, dynamic> json) {
    return Riwayat(
      transactionCode: json['transaction_code'],
      userId: json['user_id'],
      total: json['total'],
      paymentMethod: json['payment_method'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_code': transactionCode,
      'user_id': userId,
      'total': total,
      'payment_method': paymentMethod,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
