import 'package:car_world_system/sources/model/accessory.dart';
import 'package:car_world_system/sources/model/brand.dart';
import 'package:car_world_system/sources/repository/accessory_repository.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:rxdart/rxdart.dart';

class AccessoryBloc {
  final AccessoryRepository accessoryRepository = AccessoryRepository();

  final _listAccessoryFetcher = PublishSubject<List<Accessory>>();
  final _accessoryDetailFetcher = PublishSubject<Accessory>();
  final _brandDetailFetcher = PublishSubject<Brand>();

  Observable<List<Accessory>> get listAccessory => _listAccessoryFetcher.stream;
  Observable<Accessory> get accessoryDetail => _accessoryDetailFetcher.stream;
  Observable<Brand> get brandDetail => _brandDetailFetcher.stream;
  //get list all accessory
  getListAccessory() async {
    List<Accessory> listAccessory =
        await accessoryRepository.getListAccessory();
    _listAccessoryFetcher.sink.add(listAccessory);
  }

  //get list accessory by name
  getListAccessoryByName(String name) async {
    List<Accessory> listAccessoryByName =
        await accessoryRepository.getListAccessoryByName(name);
    _listAccessoryFetcher.sink.add(listAccessoryByName);
  }
    //get list accessory by name
  getListAccessoryByBrandName(String name) async {
    List<Accessory> listAccessoryByBrandName =
        await accessoryRepository.getListAccessoryByBrandName(name);
    _listAccessoryFetcher.sink.add(listAccessoryByBrandName);
  }

  //get accessory detail by id
  getAccessoryDetail(int id) async {
    Accessory accessoryDetail =
        await accessoryRepository.getAccessoryDetail(id);
    _accessoryDetailFetcher.sink.add(accessoryDetail);
  }
    //get brand detail by id
  getBrandDetail(int id) async {
    Brand brandDetail =
        await accessoryRepository.getBrandDetail(id);
    _brandDetailFetcher.sink.add(brandDetail);
  }

  dispose() {
    _listAccessoryFetcher.close();
    _accessoryDetailFetcher.close();
    _brandDetailFetcher.close();
  }
}

final accessoryBloc = AccessoryBloc();
