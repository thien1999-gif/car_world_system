import 'package:car_world_system/sources/model/exchange_accessory.dart';
import 'package:car_world_system/sources/model/exchange_car.dart';
import 'package:car_world_system/sources/repository/exchange_accessory_repository.dart';
import 'package:rxdart/rxdart.dart';

class ExchangeBloc {
  final ExchangeAccessoryRepository exchangeAccessoryRepository =
      ExchangeAccessoryRepository();

  final _listExchangeAccessoryOfUserFetcher =
      PublishSubject<List<ExchangeAccessory>>();
  final _exchangeAccessoryDetailOfUserFetcher =
      PublishSubject<ExchangeAccessory>();

      final _listExchangeCarOfUserFetcher =
      PublishSubject<List<ExchangeCar>>();
  final _exchangeCarDetailOfUserFetcher =
      PublishSubject<ExchangeCar>();

  Observable<List<ExchangeAccessory>> get listExchangeAccessoryOfUser =>
      _listExchangeAccessoryOfUserFetcher.stream;
  Observable<ExchangeAccessory> get exchangeAccessoryDetail =>
      _exchangeAccessoryDetailOfUserFetcher.stream;

        Observable<List<ExchangeCar>> get listExchangeCarOfUser =>
      _listExchangeCarOfUserFetcher.stream;
  Observable<ExchangeCar> get exchangeCarDetail =>
      _exchangeCarDetailOfUserFetcher.stream;

  //get list exchange accessory by user id
  getListExchangeAccessoryOfUser(int id) async {
    List<ExchangeAccessory> list =
        await exchangeAccessoryRepository.getAllExchangeAccessoryByUserID(id);
    _listExchangeAccessoryOfUserFetcher.sink.add(list);
  }

   //get list exchange car by user id
  getListExchangeCarOfUser(int id) async {
    List<ExchangeCar> list =
        await exchangeAccessoryRepository.getAllExchangeCarByUserID(id);
    _listExchangeCarOfUserFetcher.sink.add(list);
  }

  //get event detail by id
  getExchangeAccessoryDetail(String id) async {
    ExchangeAccessory exchangeAccessoryDetail =
        await exchangeAccessoryRepository.getDetailExchangeAccessory(id);
    _exchangeAccessoryDetailOfUserFetcher.sink.add(exchangeAccessoryDetail);
  }

    //get event detail by id
  getExchangeCarDetail(String id) async {
    ExchangeCar exchangeAccessoryDetail =
        await exchangeAccessoryRepository.getDetailExchangeCar(id);
    _exchangeCarDetailOfUserFetcher.sink.add(exchangeAccessoryDetail);
  }

  dispose() {
    _listExchangeAccessoryOfUserFetcher.close();
    _exchangeAccessoryDetailOfUserFetcher.close();
    _listExchangeCarOfUserFetcher.close();
    _exchangeCarDetailOfUserFetcher.close();
  }
}
final exchangeBloc = ExchangeBloc();