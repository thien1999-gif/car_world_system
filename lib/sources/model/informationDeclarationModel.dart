class InformationDeclarationModel {
  String email;
  String fullName;
  int gender;
  String yearOfBirth;
  String image;
  String phone;
  String address;

  InformationDeclarationModel({
    required this.email,
    required this.fullName,
    required this.gender,
    required this.yearOfBirth,
    required this.image,
    required this.phone,
    required this.address,
  });

  factory InformationDeclarationModel.fromJson(Map<String, dynamic> json) =>
      InformationDeclarationModel(
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        yearOfBirth: json["yearOfBirth"],
        image: json["image"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "email": this.email,
        "fullName": this.fullName,
        "gender": this.gender,
        "yearOfBirth": this.yearOfBirth,
        "image": this.image,
        "phone": this.phone,
        "address": this.address,
      };
}
