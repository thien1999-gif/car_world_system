import 'dart:convert';

ExchangeAccessory exchangeAccessoryFromJson(String str) =>
    ExchangeAccessory.fromJson(json.decode(str));

String exchangeAccessoryToJson(ExchangeAccessory data) =>
    json.encode(data.toJson());

class ExchangeAccessory {
  ExchangeAccessory({
    required this.userId,
    required this.title,
    required this.description,
    required this.address,
    required this.exchangeAccDetails,
  });

  int userId;
  String title;
  String description;
  String address;
  List<ExchangeAccDetail> exchangeAccDetails;

  factory ExchangeAccessory.fromJson(Map<String, dynamic> json) =>
      ExchangeAccessory(
        userId: json["userId"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        exchangeAccDetails: List<ExchangeAccDetail>.from(
            json["exchangeAccDetails"]
                .map((x) => ExchangeAccDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "description": description,
        "address": address,
        "exchangeAccDetails":
            List<dynamic>.from(exchangeAccDetails.map((x) => x.toJson())),
      };
}

class ExchangeAccDetail {
  ExchangeAccDetail({
    required this.accessoryName,
    required this.isUsed,
    required this.image,
    required this.price,
    required this.amount,
  });

  String accessoryName;
  bool isUsed;
  String image;
  int price;
  int amount;

  factory ExchangeAccDetail.fromJson(Map<String, dynamic> json) =>
      ExchangeAccDetail(
        accessoryName: json["accessoryName"],
        isUsed: json["isUsed"],
        image: json["image"],
        price: json["price"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "accessoryName": accessoryName,
        "isUsed": isUsed,
        "image": image,
        "price": price,
        "amount": amount,
      };
}