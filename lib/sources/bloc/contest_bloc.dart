import 'package:car_world_system/sources/model/contest.dart';
import 'package:car_world_system/sources/model/contest_register.dart';
import 'package:car_world_system/sources/repository/contest_repository.dart';
import 'package:rxdart/rxdart.dart';

class ContestBloc {
  final ContestRepository contestRepository = ContestRepository();

  final _listContestFetcher = PublishSubject<List<Contest>>();
  final _contestDetailFetcher = PublishSubject<Contest>();
  final _listContestRegisterFetcher = PublishSubject<List<ContestRegister>>();

  Observable<List<ContestRegister>> get listContestRegister =>
      _listContestRegisterFetcher.stream;
  Observable<List<Contest>> get listContest => _listContestFetcher.stream;
  Observable<Contest> get contestDetail => _contestDetailFetcher.stream;
  //get list new contest
  getListNewContest(String now) async {
    List<Contest> listContest = await contestRepository.getListNewContest(now);
    _listContestFetcher.sink.add(listContest);
  }

  //get list significant contest
  getListSignficantContest(String now) async {
    List<Contest> listContest =
        await contestRepository.getListSignficantContest(now);
    _listContestFetcher.sink.add(listContest);
  }

  //get list contest user register
  getListContestUserRegister(int id) async {
    List<ContestRegister> listContestRegister =
        await contestRepository.getListContestUserRegister(id);
    _listContestRegisterFetcher.sink.add(listContestRegister);
  }

  //get list contest user joined
  getListContestUserJoined(int id) async {
    List<ContestRegister> listContestRegister =
        await contestRepository.getListContestUserJoined(id);
    _listContestRegisterFetcher.sink.add(listContestRegister);
  }

  //get contest detail by id
  getContestDetail(int id) async {
    Contest contestDetail = await contestRepository.getContestDetail(id);
    _contestDetailFetcher.sink.add(contestDetail);
  }

  dispose() {
    _listContestFetcher.close();
    _contestDetailFetcher.close();
    _listContestRegisterFetcher.close();
  }
}

final contestBloc = ContestBloc();
