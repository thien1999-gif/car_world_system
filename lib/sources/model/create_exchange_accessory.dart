// To parse this JSON data, do
//
//     final createExchangeAccessory = createExchangeAccessoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateExchangeAccessory createExchangeAccessoryFromJson(String str) =>
    CreateExchangeAccessory.fromJson(json.decode(str));

String createExchangeAccessoryToJson(CreateExchangeAccessory data) =>
    json.encode(data.toJson());

class CreateExchangeAccessory {
  CreateExchangeAccessory({
    required this.userId,
    required this.title,
    required this.description,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.exchangeAccessorryDetails,
  });

  int userId;
  String title;
  String description;
  String address;
  double longitude;
  double latitude;
  List<ExchangeAccessorryDetail> exchangeAccessorryDetails;

  factory CreateExchangeAccessory.fromJson(Map<String, dynamic> json) =>
      CreateExchangeAccessory(
        userId: json["userId"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        exchangeAccessorryDetails: List<ExchangeAccessorryDetail>.from(
            json["exchangeAccessorryDetails"]
                .map((x) => ExchangeAccessorryDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "description": description,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "exchangeAccessorryDetails": List<dynamic>.from(
            exchangeAccessorryDetails.map((x) => x.toJson())),
      };
}

class ExchangeAccessorryDetail {
  ExchangeAccessorryDetail({
    required this.brandName,
    required this.accessoryName,
    required this.isUsed,
    required this.image,
    required this.price,
    required this.amount,
  });

  String brandName;
  String accessoryName;
  bool isUsed;
  String image;
  int price;
  int amount;

  factory ExchangeAccessorryDetail.fromJson(Map<String, dynamic> json) =>
      ExchangeAccessorryDetail(
        brandName: json["brandName"],
        accessoryName: json["accessoryName"],
        isUsed: json["isUsed"],
        image: json["image"],
        price: json["price"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "brandName": brandName,
        "accessoryName": accessoryName,
        "isUsed": isUsed,
        "image": image,
        "price": price,
        "amount": amount,
      };
}
