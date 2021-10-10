import 'dart:convert';

import 'package:car_world_system/sources/model/exchange_accessory.dart';
import 'package:car_world_system/sources/repository/exchange_accessory_api_string.dart';
import 'package:http/http.dart' as http;
class ExchangeAccessoryApiProvider{
    //create exchange accessory
  Future<bool> createExchangeAccessory(ExchangeAccessory exchangeAccessory) async {
    final response = await http.post(
      ExchangeAccessoryApiString.createExchangeAccessory(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(exchangeAccessory),
    );
    if (response.statusCode == 200) {
      print("thanh cong");

      // final Map<String, dynamic> data = json.decode(response.body);

      // Proposal responseProposal = Proposal.fromJson(data);

      // return responseProposal;
      print(response.body);
      return true; 
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Failed to user create exchange accessory.');
      // return false;
      
    }
  }
}