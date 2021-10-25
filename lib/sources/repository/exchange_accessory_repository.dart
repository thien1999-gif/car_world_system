import 'package:car_world_system/sources/model/create_exchange_accessory.dart';
import 'package:car_world_system/sources/model/create_exchange_car.dart';
import 'package:car_world_system/sources/model/exchange_accessory.dart';
import 'package:car_world_system/sources/model/exchange_car.dart';
import 'package:car_world_system/sources/model/send_exchange_response.dart';
import 'package:car_world_system/sources/model/user_exchange_response.dart';
import 'package:car_world_system/sources/repository/exchange_accessory_api_provider.dart';

class ExchangeAccessoryRepository {
  ExchangeAccessoryApiProvider exchangeAccessoryApiProvider =
      ExchangeAccessoryApiProvider();
  //create exchange accessory
  Future<bool> createExchangeAccessory(
      CreateExchangeAccessory exchangeAccessory) {
    return exchangeAccessoryApiProvider
        .createExchangeAccessory(exchangeAccessory);
  }

  //get all exchange accessory by user id
  Future<List<ExchangeAccessory>> getAllExchangeAccessoryByUserID(int id) {
    return exchangeAccessoryApiProvider.getListExchangeAccesoryByUserID(id);
  }

  //get detail exchange accessory
  Future<ExchangeAccessory> getDetailExchangeAccessory(String id) {
    return exchangeAccessoryApiProvider.getExchangeAccessoryDetail(id);
  }

    //cancel exchange accessory
  Future<bool> cancelExchangeAccessory(String id) {
    return exchangeAccessoryApiProvider.cancelExchangeAccessory(id);
  }

//////////////////

    //create exchange car
  Future<bool> createExchangeCar(
      CreateExchangeCar exchangeCar) {
    return exchangeAccessoryApiProvider
        .createExchangeCar(exchangeCar);
  }

    //get all exchange car by user id
  Future<List<ExchangeCar>> getAllExchangeCarByUserID(int id) {
    return exchangeAccessoryApiProvider.getListExchangeCarByUserID(id);
  }

  //get detail exchange car
  Future<ExchangeCar> getDetailExchangeCar(String id) {
    return exchangeAccessoryApiProvider.getExchangeCarDetail(id);
  }

    //cancel exchange accessory
  Future<bool> cancelExchangeCar(String id) {
    return exchangeAccessoryApiProvider.cancelExchangeCar(id);
  }
  ///////
     //get list exchange car by location
  Future<List<ExchangeCar>> getListExchangeCarByLocation() {
    return exchangeAccessoryApiProvider.getListExchangeCarByLocation();
  }

   Future<List<ExchangeAccessory>> getListExchangeAccessoryByLocation() {
    return exchangeAccessoryApiProvider.getListExchangeAccessoryByLocation();
  }
// send exchange response
   Future<bool> sendExchangeResponeseCarAndAccessory(SendExchangeResponse exchangeResponse){
    return exchangeAccessoryApiProvider
        .sendExchangeResponeseCarAndAccessory(exchangeResponse);
  }

      //get list exchange car by location
  Future<List<UserExchangeResponse>> getListUserWanttoExchange(String id) {
    return exchangeAccessoryApiProvider.getListUserWanttoExchange(id);
  }
}
