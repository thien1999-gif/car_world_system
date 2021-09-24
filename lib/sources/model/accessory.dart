class Accessory {
  int id;
  String name;
  int brandId;
  String description;
  int price;
  String image;
  bool isDeleted;
  // String brand;

  Accessory({
    required this.id,
    required this.name,
    required this.brandId,
    required this.description,
    required this.price,
    required this.image,
    required this.isDeleted,
    // required this.brand,
  });

 factory Accessory.fromJson(Map<String, dynamic> json) {
    return Accessory(
    id : json['Id'],
    name : json['Name'],
    brandId : json['BrandId'],
    description : json['Description'],
    price : json['Price'],
    image : json['Image'],
    isDeleted : json['IsDeleted'],
    // brand : (json['Brand'] != null ? new Brand.fromJson(json['Brand']) : null)!
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['BrandId'] = this.brandId;
    data['Description'] = this.description;
    data['Price'] = this.price;
    data['Image'] = this.image;
    data['IsDeleted'] = this.isDeleted;
    // if (this.brand != null) {
    //   data['Brand'] = this.brand.toJson();
    // }

    return data;
  }
}

