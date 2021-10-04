const String BASE_URL = "https://carworld.cosplane.asia";

class CarApiString {
  //get all car
  // https://carworld.cosplane.asia/api/car/GetAllCars
  static String getListCar() {
    return BASE_URL + '/api/car/GetAllCars';
  }

  //get all car by name
  // https://carworld.cosplane.asia/api/car/GetCarByName?carName=b
  static String getListCarByName(String name) {
    return BASE_URL + '/api/car/GetCarsByName?carName=$name';
  }

  //get all car by brand name
  // https://carworld.cosplane.asia/api/car/GetCarsByBrand?brandName=Aston%20Martin
  static String getListCarByBrandName(String brandName) {
    return BASE_URL + '/api/car/GetCarsByBrand?brandName=$brandName';
  }

  //get car detail by id
  // https://carworld.cosplane.asia/api/car/GetCarById?id=1
  static String getCarDetail(int id) {
    return BASE_URL + '/api/car/GetCarById?id=$id';
  }
}
