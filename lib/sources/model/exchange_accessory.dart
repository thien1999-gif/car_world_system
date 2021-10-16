// To parse this JSON data, do
//
//     final managerExchangeAccessory = managerExchangeAccessoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ExchangeAccessory {
  ExchangeAccessory({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.total,
    required this.createdDate,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.status,
    //   required this.feedbackId,
    // required this.feedback,
    //   required this.user,
    required this.exchangeAccessorryDetails,
    // required this.exchangeResponses,
  });

  String id;
  int userId;
  String title;
  String description;
  int total;
  String createdDate;
  String address;
  double longitude;
  double latitude;
  int status;
  // dynamic feedbackId;
  // dynamic feedback;
  // dynamic user;
  List<ListExchangeAccessorryDetail> exchangeAccessorryDetails;
  // List<dynamic> exchangeResponses;

  factory ExchangeAccessory.fromJson(Map<String, dynamic> json) =>
      ExchangeAccessory(
        id: json["Id"],
        userId: json["UserId"],
        title: json["Title"],
        description: json["Description"],
        total: json["Total"],
        createdDate: json["CreatedDate"],
        address: json["Address"],
        longitude: json["Longitude"].toDouble(),
        latitude: json["Latitude"].toDouble(),
        status: json["Status"],
        // feedbackId: json["FeedbackId"],
        // feedback: json["Feedback"],
        // user: json["User"],
        exchangeAccessorryDetails: List<ListExchangeAccessorryDetail>.from(
            json["ExchangeAccessorryDetails"]
                .map((x) => ListExchangeAccessorryDetail.fromJson(x))),
        //exchangeResponses: List<dynamic>.from(json["ExchangeResponses"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "Title": title,
        "Description": description,
        "Total": total,
        "CreatedDate": createdDate,
        "Address": address,
        "Longitude": longitude,
        "Latitude": latitude,
        "Status": status,
        // "FeedbackId": feedbackId,
        // "Feedback": feedback,
        // "User": user,
        "ExchangeAccessorryDetails": List<dynamic>.from(
            exchangeAccessorryDetails.map((x) => x.toJson())),
        //"ExchangeResponses": List<dynamic>.from(exchangeResponses.map((x) => x)),
      };
}

class ListExchangeAccessorryDetail {
  ListExchangeAccessorryDetail({
    required this.id,
    required this.exchangeAccessoryId,
    required this.brandName,
    required this.accessoryName,
    required this.isUsed,
    required this.image,
    required this.price,
    required this.amount,
  });

  String id;
  String exchangeAccessoryId;
  String brandName;
  String accessoryName;
  bool isUsed;
  String image;
  int price;
  int amount;

  factory ListExchangeAccessorryDetail.fromJson(Map<String, dynamic> json) =>
      ListExchangeAccessorryDetail(
        id: json["Id"],
        exchangeAccessoryId: json["ExchangeAccessoryId"],
        brandName: json["BrandName"],
        accessoryName: json["AccessoryName"],
        isUsed: json["IsUsed"],
        image: json["Image"],
        price: json["Price"],
        amount: json["Amount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ExchangeAccessoryId": exchangeAccessoryId,
        "BrandName": brandName,
        "AccessoryName": accessoryName,
        "IsUsed": isUsed,
        "Image": image,
        "Price": price,
        "Amount": amount,
      };
}
