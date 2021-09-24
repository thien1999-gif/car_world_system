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
    return BASE_URL + '/api/car/GetCarByName?carName=$name';
  }

    //get car detail by id
  // https://carworld.cosplane.asia/api/car/GetCarById?id=1
  static String getCarDetail(int id) {
    return BASE_URL + '/api/car/GetCarById?id=$id';
  }
}
