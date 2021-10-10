import 'package:car_world_system/sources/model/exchange_accessory.dart';
import 'package:car_world_system/sources/repository/exchange_accessory_api_provider.dart';

class ExchangeAccessoryRepository{
  ExchangeAccessoryApiProvider exchangeAccessoryApiProvider = ExchangeAccessoryApiProvider();
  //create proposal
   Future<bool>createExchangeAccessory(ExchangeAccessory exchangeAccessory) {
    return exchangeAccessoryApiProvider.createExchangeAccessory(exchangeAccessory);
  }
}