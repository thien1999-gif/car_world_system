// To parse this JSON data, do
//
//     final exchangeAccessory = exchangeAccessoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ExchangeAccessory> exchangeAccessoryFromJson(String str) => List<ExchangeAccessory>.from(json.decode(str).map((x) => ExchangeAccessory.fromJson(x)));

String exchangeAccessoryToJson(List<ExchangeAccessory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExchangeAccessory {
    ExchangeAccessory({
        required this.id,
        required this.type,
        required this.userId,
        required this.title,
        required this.description,
        required this.total,
        required this.createdDate,
        required this.address,
        required this.status,
        // @required this.feedbackId,
        // @required this.feedback,
        // @required this.user,
        required this.exchangeAccessorryDetails,
        // @required this.exchangeCarDetails,
        // @required this.exchangeResponses,
    });

    String id;
    int type;
    int userId;
    String title;
    String description;
    double total;
    String createdDate;
    String address;
    int status;
    // dynamic feedbackId;
    // dynamic feedback;
    // dynamic user;
    List<ListExchangeAccessorryDetail> exchangeAccessorryDetails;
    // List<dynamic> exchangeCarDetails;
    // List<dynamic> exchangeResponses;

    factory ExchangeAccessory.fromJson(Map<String, dynamic> json) => ExchangeAccessory(
        id: json["Id"],
        type: json["Type"],
        userId: json["UserId"],
        title: json["Title"],
        description: json["Description"],
        total: json["Total"],
        createdDate: json["CreatedDate"],
        address: json["Address"],
        status: json["Status"],
        // feedbackId: json["FeedbackId"],
        // feedback: json["Feedback"],
        // user: json["User"],
        exchangeAccessorryDetails: List<ListExchangeAccessorryDetail>.from(json["ExchangeAccessorryDetails"].map((x) => ListExchangeAccessorryDetail.fromJson(x))),
        // exchangeCarDetails: List<dynamic>.from(json["ExchangeCarDetails"].map((x) => x)),
        // exchangeResponses: List<dynamic>.from(json["ExchangeResponses"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Type": type,
        "UserId": userId,
        "Title": title,
        "Description": description,
        "Total": total,
        "CreatedDate": createdDate,
        "Address": address,
        "Status": status,
        // "FeedbackId": feedbackId,
        // "Feedback": feedback,
        // "User": user,
        "ExchangeAccessorryDetails": List<dynamic>.from(exchangeAccessorryDetails.map((x) => x.toJson())),
        // "ExchangeCarDetails": List<dynamic>.from(exchangeCarDetails.map((x) => x)),
        // "ExchangeResponses": List<dynamic>.from(exchangeResponses.map((x) => x)),
    };
}

class ListExchangeAccessorryDetail {
    ListExchangeAccessorryDetail({
        required this.id,
        required this.exchangeId,
        required this.brandName,
        required this.accessoryName,
        required this.isUsed,
        required this.image,
        required this.price,
        required this.amount,
    });

    String id;
    String exchangeId;
    String brandName;
    String accessoryName;
    bool isUsed;
    String image;
    int price;
    int amount;

    factory ListExchangeAccessorryDetail.fromJson(Map<String, dynamic> json) => ListExchangeAccessorryDetail(
        id: json["Id"],
        exchangeId: json["ExchangeId"],
        brandName: json["BrandName"],
        accessoryName: json["AccessoryName"],
        isUsed: json["IsUsed"],
        image: json["Image"],
        price: json["Price"],
        amount: json["Amount"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "ExchangeId": exchangeId,
        "BrandName": brandName,
        "AccessoryName": accessoryName,
        "IsUsed": isUsed,
        "Image": image,
        "Price": price,
        "Amount": amount,
    };
}
