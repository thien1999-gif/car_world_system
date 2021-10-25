const String BASE_URL = "https://carworld.cosplane.asia";

class ExchangeAccessoryApiString {
//create exchange accessory
  static String createExchangeAccessory() {
    return BASE_URL + '/api/exchange/CreateAccessoryExchange';
  }

  //get all exchange accessory by user id
  static String getAllExchangeAccessoryByUserID(int id) {
    return BASE_URL + '/api/exchange/GetUserExchanges?type=2&userId=$id';
  }

  //get detail exchange accessory of user for manager
  static String getDetailExchangeAccessory(String id) {
    return BASE_URL + '/api/exchange/GetExchangeById?id=$id';
  }

    //user cancel exchange accessory  
  static String cancelExchangeAccessory(String id) {
    return BASE_URL + '/api/exchange/CancelExchange?id=$id';
  }


//create exchange car
//https://carworld.cosplane.asia/api/exchangeCar/CreateExchangeCar
  static String createExchangeCar() {
    return BASE_URL + '/api/exchange/CreateCarExchange';
  }

  //get all exchange car by user id
  //https://carworld.cosplane.asia/api/exchangeCar/GetAllExchanges?userId=1
  static String getAllExchangeCarByUserID(int id) {
    return BASE_URL + '/api/exchange/GetUserExchanges?type=1&userId=$id';
  }

  //get detail exchange car of user for manager
  //https://carworld.cosplane.asia/api/exchangeCar/GetExchangeById?id=2edvvvvvvvvvvvvv
  static String getDetailExchangeCar(String id) {
    return BASE_URL + '/api/exchange/GetExchangeById?id=$id';
  }

    //user cancel exchange car  
  //https://carworld.cosplane.asia/api/exchangeCar/CancelExchange?id=ddddd
  static String cancelExchangeCar(String id) {
    return BASE_URL + '/api/exchange/CancelExchange?id=$id';
  }
  //get list exchange car by location filter
  static String getListExchangeCarByLocation(){
    return BASE_URL + "/api/exchange/GetAllExchanges?type=1";
  }

   //get list exchange accessory by location filter
  static String getListExchangeAccessoryByLocation(){
    return BASE_URL + "/api/exchange/GetAllExchanges?type=2";
  }
    //send exchange response car
  static String sendExchangeResponeseCarAndAccessory(){
    return BASE_URL + "/api/exchangeResponse/SendExResponse";
  }

    //get list user want to exchange
  static String getListUserWanttoExchange(String id){
    return BASE_URL + "/api/exchangeResponse/GetExResponses?exchangeId=$id";
  }
}
