class User {
  int id;
  String name;
  String email;
  String? emailVerifiedAt;
  String alamat;
  String phone;
  String createdAt;
  String updatedAt;
  String roles;
  String? photo;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.alamat,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      alamat: json['alamat'],
      phone: json['phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      roles: json['roles'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['alamat'] = this.alamat;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['roles'] = this.roles;
    data['photo'] = this.photo;
    return data;
  }
}
