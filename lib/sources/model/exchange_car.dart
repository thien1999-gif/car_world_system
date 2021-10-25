// To parse this JSON data, do
//
//     final exchangeCar = exchangeCarFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ExchangeCar> exchangeCarFromJson(String str) => List<ExchangeCar>.from(json.decode(str).map((x) => ExchangeCar.fromJson(x)));

String exchangeCarToJson(List<ExchangeCar> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExchangeCar {
    ExchangeCar({
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
        // @required this.exchangeAccessorryDetails,
        required this.exchangeCarDetails,
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
    // List<dynamic> exchangeAccessorryDetails;
    List<ListExchangeCarDetail> exchangeCarDetails;
    // List<dynamic> exchangeResponses;

    factory ExchangeCar.fromJson(Map<String, dynamic> json) => ExchangeCar(
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
        //exchangeAccessorryDetails: List<dynamic>.from(json["ExchangeAccessorryDetails"].map((x) => x)),
        exchangeCarDetails: List<ListExchangeCarDetail>.from(json["ExchangeCarDetails"].map((x) => ListExchangeCarDetail.fromJson(x))),
        //exchangeResponses: List<dynamic>.from(json["ExchangeResponses"].map((x) => x)),
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
        // "ExchangeAccessorryDetails": List<dynamic>.from(exchangeAccessorryDetails.map((x) => x)),
        "ExchangeCarDetails": List<dynamic>.from(exchangeCarDetails.map((x) => x.toJson())),
        // "ExchangeResponses": List<dynamic>.from(exchangeResponses.map((x) => x)),
    };
}

class ListExchangeCarDetail {
    ListExchangeCarDetail({
        required this.id,
        required this.exchangeId,
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

    String id;
    String exchangeId;
    String brandName;
    String carName;
    int yearOfManufactor;
    String origin;
    String licensePlate;
    bool isUsed;
    double kilometers;
    int yearOfUsed;
    String image;
    int price;
    int amount;

    factory ListExchangeCarDetail.fromJson(Map<String, dynamic> json) => ListExchangeCarDetail(
        id: json["Id"],
        exchangeId: json["ExchangeId"],
        brandName: json["BrandName"],
        carName: json["CarName"],
        yearOfManufactor: json["YearOfManufactor"],
        origin: json["Origin"],
        licensePlate: json["LicensePlate"],
        isUsed: json["IsUsed"],
        kilometers: json["Kilometers"],
        yearOfUsed: json["YearOfUsed"],
        image: json["Image"],
        price: json["Price"],
        amount: json["Amount"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "ExchangeId": exchangeId,
        "BrandName": brandName,
        "CarName": carName,
        "YearOfManufactor": yearOfManufactor,
        "Origin": origin,
        "LicensePlate": licensePlate,
        "IsUsed": isUsed,
        "Kilometers": kilometers,
        "YearOfUsed": yearOfUsed,
        "Image": image,
        "Price": price,
        "Amount": amount,
    };
}
