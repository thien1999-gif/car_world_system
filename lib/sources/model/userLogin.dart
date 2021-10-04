class UserLogin {
  String email;
  String fullName;
  String image;
  String phone;
  // String brand;

  UserLogin({
    required this.email,
    required this.fullName,
    required this.image,
    required this.phone,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        email: json['Email'],
        fullName: json['FullName'],
        image: json['Image'],
        phone: json['Phone']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['FullName'] = this.fullName;
    data['Image'] = this.image;
    data['Phone'] = this.phone;
    return data;
  }
}
