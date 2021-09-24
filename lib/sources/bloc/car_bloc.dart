import 'package:car_world_system/sources/model/car.dart';
import 'package:car_world_system/sources/repository/car_repository.dart';
import 'package:rxdart/rxdart.dart';

class CarBloc {
  final CarRepository carRepository = CarRepository();
  final _listCarFetcher = PublishSubject<List<Car>>();
  final _carDetailFetcher = PublishSubject<Car>();

  Observable<List<Car>> get listCar => _listCarFetcher.stream;
  Observable<Car> get carDetail => _carDetailFetcher.stream;
  //get list all car
  getListCar() async {
    List<Car> listCar = await carRepository.getListcar();
    _listCarFetcher.sink.add(listCar);
  }

  //get list accessory by name
  getListCarByName(String name) async {
    List<Car> listCarByName = await carRepository.getListCarByName(name);
    _listCarFetcher.sink.add(listCarByName);
  }

  //get car detail by id
  getAccessoryDetail(int id) async {
    Car carDetail = await carRepository.getCarDetail(id);
    _carDetailFetcher.sink.add(carDetail);
  }

  dispose() {
    _listCarFetcher.close();
    _carDetailFetcher.close();
  }
}

final carBloc = CarBloc();
