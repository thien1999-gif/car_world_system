import 'package:car_world_system/sources/model/accessory.dart';
import 'package:car_world_system/sources/model/brand.dart';
import 'package:car_world_system/sources/repository/accessory_api_provider.dart';

class AccessoryRepository {
  AccessoryApiProvider accessoryApiProvider = AccessoryApiProvider();

  //get list all accessory
  Future<List<Accessory>> getListAccessory() {
    return accessoryApiProvider.getListAccessory();
  }

  //get list accessory by name
  Future<List<Accessory>> getListAccessoryByName(String name) {
    return accessoryApiProvider.getListAccessoryByName(name);
  }

  //get accessory detail by id
  Future<Accessory> getAccessoryDetail(int id) {
    return accessoryApiProvider.getAccessoryDetail(id);
  }
    //get brand detail by id
  Future<Brand> getBrandDetail(int id) {
    return accessoryApiProvider.getBrandDetail(id);
  }
}
