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
        required this.userId,
        required this.title,
        required this.description,
        required this.total,
        required this.createdDate,
        required this.address,
        required this.longitude,
        required this.latitude,
        required this.status,
        // @required this.feedbackId,
        // @required this.feedback,
        // @required this.user,
        required this.exchangeCarDetails,
       // @required this.exchangeResponses,
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
    List<ListExchangeCarDetail> exchangeCarDetails;
    // List<dynamic> exchangeResponses;

    factory ExchangeCar.fromJson(Map<String, dynamic> json) => ExchangeCar(
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
        exchangeCarDetails: List<ListExchangeCarDetail>.from(json["ExchangeCarDetails"].map((x) => ListExchangeCarDetail.fromJson(x))),
       // exchangeResponses: List<dynamic>.from(json["ExchangeResponses"].map((x) => x)),
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
        "ExchangeCarDetails": List<dynamic>.from(exchangeCarDetails.map((x) => x.toJson())),
       // "ExchangeResponses": List<dynamic>.from(exchangeResponses.map((x) => x)),
    };
}

class ListExchangeCarDetail {
    ListExchangeCarDetail({
        required this.id,
        required this.exchangeCarId,
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
    String exchangeCarId;
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
        exchangeCarId: json["ExchangeCarId"],
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
        "ExchangeCarId": exchangeCarId,
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
