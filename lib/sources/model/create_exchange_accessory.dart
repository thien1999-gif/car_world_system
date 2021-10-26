// To parse this JSON data, do
//
//     final createExchangeAccessory = createExchangeAccessoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CreateExchangeAccessory createExchangeAccessoryFromJson(String str) => CreateExchangeAccessory.fromJson(json.decode(str));

String createExchangeAccessoryToJson(CreateExchangeAccessory data) => json.encode(data.toJson());

class CreateExchangeAccessory {
    CreateExchangeAccessory({
        required this.userId,
        required this.title,
        required this.description,
        required this.phone,
        required this.address,
        required this.cityId,
        required this.districtId,
        required this.wardId,
        required this.exchangeAccessorryDetails,
    });

    int userId;
    String title;
    String description;
    String phone;
    String address;
    String cityId;
    String districtId;
    String wardId;
    List<ExchangeAccessorryDetail> exchangeAccessorryDetails;

    factory CreateExchangeAccessory.fromJson(Map<String, dynamic> json) => CreateExchangeAccessory(
        userId: json["userId"],
        title: json["title"],
        description: json["description"],
        phone: json["phone"],
        address: json["address"],
        cityId: json["cityId"],
        districtId: json["districtId"],
        wardId: json["wardId"],
        exchangeAccessorryDetails: List<ExchangeAccessorryDetail>.from(json["exchangeAccessorryDetails"].map((x) => ExchangeAccessorryDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "description": description,
        "phone": phone,
        "address": address,
        "cityId": cityId,
        "districtId": districtId,
        "wardId": wardId,
        "exchangeAccessorryDetails": List<dynamic>.from(exchangeAccessorryDetails.map((x) => x.toJson())),
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

    factory ExchangeAccessorryDetail.fromJson(Map<String, dynamic> json) => ExchangeAccessorryDetail(
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
