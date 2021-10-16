const String BASE_URL = "https://carworld.cosplane.asia";

class ExchangeAccessoryApiString {
//create exchange accessory
//https://carworld.cosplane.asia/api/exchangeAccessory/CreateExchangeAccessory
  static String createExchangeAccessory() {
    return BASE_URL + '/api/exchangeAccessory/CreateExchangeAccessory';
  }

  //get all exchange accessory by user id
  //https://carworld.cosplane.asia/api/exchangeAccessory/GetAllExchanges?userId=18
  static String getAllExchangeAccessoryByUserID(int id) {
    return BASE_URL + '/api/exchangeAccessory/GetAllExchanges?userId=$id';
  }

  //get detail exchange accessory of user for manager
  //https://carworld.cosplane.asia/api/exchangeAccessory/GetExchangeById?id=db45b2bb-7c00-4dec-820f-93f30397c67c
  static String getDetailExchangeAccessory(String id) {
    return BASE_URL + '/api/exchangeAccessory/GetExchangeById?id=$id';
  }

    //user cancel exchange accessory  
  //https://carworld.cosplane.asia/api/exchangeAccessory/CancelExchange?id=dwdw
  static String cancelExchangeAccessory(String id) {
    return BASE_URL + '/api/exchangeAccessory/CancelExchange?id=$id';
  }


//create exchange car
//https://carworld.cosplane.asia/api/exchangeCar/CreateExchangeCar
  static String createExchangeCar() {
    return BASE_URL + '/api/exchangeCar/CreateExchangeCar';
  }

  //get all exchange car by user id
  //https://carworld.cosplane.asia/api/exchangeCar/GetAllExchanges?userId=1
  static String getAllExchangeCarByUserID(int id) {
    return BASE_URL + '/api/exchangeCar/GetAllExchanges?userId=$id';
  }

  //get detail exchange car of user for manager
  //https://carworld.cosplane.asia/api/exchangeCar/GetExchangeById?id=2edvvvvvvvvvvvvv
  static String getDetailExchangeCar(String id) {
    return BASE_URL + '/api/exchangeCar/GetExchangeById?id=$id';
  }

    //user cancel exchange car  
  //https://carworld.cosplane.asia/api/exchangeCar/CancelExchange?id=ddddd
  static String cancelExchangeCar(String id) {
    return BASE_URL + '/api/exchangeCar/CancelExchange?id=$id';
  }


}
