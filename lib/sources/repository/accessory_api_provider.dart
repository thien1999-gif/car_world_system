import 'dart:convert';

import 'package:car_world_system/sources/model/accessory.dart';
import 'package:car_world_system/sources/model/brand.dart';
import 'package:car_world_system/sources/repository/accessory_api_string.dart';
import 'package:http/http.dart' as http;

class AccessoryApiProvider {
  // get all accessory
  Future<List<Accessory>> getListAccessory() async {
    final response = await http.get(AccessoryApiString.getListAccessory());
    List<Accessory> listAccessory = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      if (data['IsDeleted'] == false) {
        Accessory accessory = Accessory(
          id: data['Id'],
          name: data['Name'],
          brandId: data['BrandId'],
          description: data['Description'],
          price: data['Price'],
          image: data['Image'],
          isDeleted: data['IsDeleted'],
          // brand: data[jsonData['Brand']]
        );
        listAccessory.add(accessory);
      }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return listAccessory;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list accessory');
    }
  }

//get list accessory by name
  Future<List<Accessory>> getListAccessoryByName(String name) async {
    final response =
        await http.get(AccessoryApiString.getListAccessoryByName(name));
    List<Accessory> listAccessory = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      if (data['IsDeleted'] == false) {
        Accessory accessory = Accessory(
          id: data['Id'],
          name: data['Name'],
          brandId: data['BrandId'],
          description: data['Description'],
          price: data['Price'],
          image: data['Image'],
          isDeleted: data['IsDeleted'],
          // brand: data[jsonData['Brand']]
        );
        listAccessory.add(accessory);
      }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return listAccessory;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list accessory by name');
    }
  }

  //get list accessory by brand name
  Future<List<Accessory>> getListAccessoryByBrandName(String name) async {
    final response =
        await http.get(AccessoryApiString.getListAccessoryByBrandName(name));
    List<Accessory> listAccessory = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      if (data['IsDeleted'] == false) {
        Accessory accessory = Accessory(
          id: data['Id'],
          name: data['Name'],
          brandId: data['BrandId'],
          description: data['Description'],
          price: data['Price'],
          image: data['Image'],
          isDeleted: data['IsDeleted'],
          // brand: data[jsonData['Brand']]
        );
        listAccessory.add(accessory);
      }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return listAccessory;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list accessory by brand name');
    }
  }

  //get accessory detail by id
  Future<Accessory> getAccessoryDetail(int id) async {
    final response = await http.get(AccessoryApiString.getAccessoryDetail(id));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return Accessory.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load accessory detail');
    }
  }

    //get brand detail by id
  Future<Brand> getBrandDetail(int id) async {
    final response = await http.get(AccessoryApiString.getBrandDetail(id));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return Brand.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load brand detail');
    }
  }
}
