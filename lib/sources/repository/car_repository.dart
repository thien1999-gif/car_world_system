import 'package:car_world_system/sources/model/car.dart';
import 'package:car_world_system/sources/repository/car_api_provider.dart';

class CarRepository {
  CarAPIProvider carAPIProvider = CarAPIProvider();

  //get all car
  Future<List<Car>> getListcar() {
    return carAPIProvider.getListCar();
  }

  //get all car by name
  Future<List<Car>> getListCarByName(String name) {
    return carAPIProvider.getListCarByName(name);
  }
    //get all car by  brand name
  Future<List<Car>> getListCarByBrandName(String brandName) {
    return carAPIProvider.getListCarByBrandName(brandName);
  }

  //get car detail by id
  Future<Car> getCarDetail(int id) {
    return carAPIProvider.getCarDetail(id);
  }
}
