import 'dart:convert';

import 'package:car_world_system/sources/model/create_exchange_accessory.dart';
import 'package:car_world_system/sources/model/create_exchange_car.dart';
import 'package:car_world_system/sources/model/exchange_accessory.dart';
import 'package:car_world_system/sources/model/exchange_car.dart';
import 'package:car_world_system/sources/repository/exchange_accessory_api_string.dart';
import 'package:http/http.dart' as http;

class ExchangeAccessoryApiProvider {
  //create exchange accessory
  Future<bool> createExchangeAccessory(
      CreateExchangeAccessory exchangeAccessory) async {
    final response = await http.post(
      ExchangeAccessoryApiString.createExchangeAccessory(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(exchangeAccessory),
    );
    if (response.statusCode == 200) {
      print("thanh cong");

      print(response.body);
      return true;
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Failed to user create exchange accessory.');
      // return false;

    }
  }

  //get list exchange accessory by user id
  Future<List<ExchangeAccessory>> getListExchangeAccesoryByUserID(
      int id) async {
    final response = await http
        .get(ExchangeAccessoryApiString.getAllExchangeAccessoryByUserID(id));
    List<ExchangeAccessory> list = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      //sử dung kiểu này khi có object ở trong json
      ExchangeAccessory exchangeAccessory = ExchangeAccessory.fromJson(data);
      list.add(exchangeAccessory);
      // }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list exchange accessory by user id');
    }
  }

  //get exchange accessory detail by id
  Future<ExchangeAccessory> getExchangeAccessoryDetail(String id) async {
    final response = await http
        .get(ExchangeAccessoryApiString.getDetailExchangeAccessory(id));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return ExchangeAccessory.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load exchange accessory detail');
    }
  }

  //cancel exchange accessory
  Future<bool> cancelExchangeAccessory(String id) async {
    final response = await http.put(
      ExchangeAccessoryApiString.cancelExchangeAccessory(id),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      // body: json.encode(userEvent),
    );
    print("vao ham huy");
    print("code" + response.statusCode.toString());
    if (response.statusCode == 200) {
      print("thanh cong hủy exchange accessory");
      return true;
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.

      return false;
    }
  }

//////////
 //create exchange car
  Future<bool> createExchangeCar( CreateExchangeCar exchangeCar) async {
    final response = await http.post(
      ExchangeAccessoryApiString.createExchangeCar(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(exchangeCar),
    );
    if (response.statusCode == 200) {
      print("thanh cong");

      print(response.body);
      return true;
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Failed to user create exchange car.');
      // return false;

    }
  }
  
    //get list exchange car by user id
  Future<List<ExchangeCar>> getListExchangeCarByUserID(
      int id) async {
    final response = await http
        .get(ExchangeAccessoryApiString.getAllExchangeCarByUserID(id));
    List<ExchangeCar> list = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      //sử dung kiểu này khi có object ở trong json
      ExchangeCar exchangeCar = ExchangeCar.fromJson(data);
      list.add(exchangeCar);
      // }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list exchange car by user id');
    }
  }

  //get exchange car detail by id
  Future<ExchangeCar> getExchangeCarDetail(String id) async {
    final response = await http
        .get(ExchangeAccessoryApiString.getDetailExchangeCar(id));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return ExchangeCar.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load exchange car detail');
    }
  }

  //cancel exchange car
  Future<bool> cancelExchangeCar(String id) async {
    final response = await http.put(
      ExchangeAccessoryApiString.cancelExchangeCar(id),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      // body: json.encode(userEvent),
    );
    print("vao ham huy");
    print("code" + response.statusCode.toString());
    if (response.statusCode == 200) {
      print("thanh cong hủy exchange accessory");
      return true;
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.

      return false;
    }
  }
}
