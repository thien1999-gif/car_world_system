// To parse this JSON data, do
//
//     final createExchangeCar = createExchangeCarFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateExchangeCar createExchangeCarFromJson(String str) =>
    CreateExchangeCar.fromJson(json.decode(str));

String createExchangeCarToJson(CreateExchangeCar data) =>
    json.encode(data.toJson());

class CreateExchangeCar {
  CreateExchangeCar({
    required this.userId,
    required this.title,
    required this.description,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.exchangeCarDetails,
  });

  int userId;
  String title;
  String description;
  String address;
  double longitude;
  double latitude;
  List<ExchangeCarDetail> exchangeCarDetails;

  factory CreateExchangeCar.fromJson(Map<String, dynamic> json) =>
      CreateExchangeCar(
        userId: json["userId"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        exchangeCarDetails: List<ExchangeCarDetail>.from(
            json["exchangeCarDetails"]
                .map((x) => ExchangeCarDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "description": description,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "exchangeCarDetails":
            List<dynamic>.from(exchangeCarDetails.map((x) => x.toJson())),
      };
}

class ExchangeCarDetail {
  ExchangeCarDetail({
    required this.brandName,
    required this.carName,
    required this.yearOfManufactor,
    required this.origin,
    required this.licensePlate,
    required this.isUsed,
    required this.kilometers,
    required this.yearOfUsed,
    required this.image,
    required this.price,
    required this.amount,
  });

  String brandName;
  String carName;
  int yearOfManufactor;
  String origin;
  String licensePlate;
  bool isUsed;
  int kilometers;
  int yearOfUsed;
  String image;
  int price;
  int amount;

  factory ExchangeCarDetail.fromJson(Map<String, dynamic> json) =>
      ExchangeCarDetail(
        brandName: json["brandName"],
        carName: json["carName"],
        yearOfManufactor: json["yearOfManufactor"],
        origin: json["origin"],
        licensePlate: json["licensePlate"],
        isUsed: json["isUsed"],
        kilometers: json["kilometers"],
        yearOfUsed: json["yearOfUsed"],
        image: json["image"],
        price: json["price"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "brandName": brandName,
        "carName": carName,
        "yearOfManufactor": yearOfManufactor,
        "origin": origin,
        "licensePlate": licensePlate,
        "isUsed": isUsed,
        "kilometers": kilometers,
        "yearOfUsed": yearOfUsed,
        "image": image,
        "price": price,
        "amount": amount,
      };
}
