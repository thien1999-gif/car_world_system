import 'package:car_world_system/sources/model/contest.dart';
import 'package:car_world_system/sources/repository/contest_repository.dart';
import 'package:rxdart/rxdart.dart';

class ContestBloc {
  final ContestRepository contestRepository = ContestRepository();

  final _listContestFetcher = PublishSubject<List<Contest>>();
  final _contestDetailFetcher = PublishSubject<Contest>();

  Observable<List<Contest>> get listContest => _listContestFetcher.stream;
  Observable<Contest> get contestDetail => _contestDetailFetcher.stream;
  //get list new contest
  getListNewContest() async {
    List<Contest> listContest = await contestRepository.getListNewContest();
    _listContestFetcher.sink.add(listContest);
  }

  //get list significant contest
  getListSignficantContest() async {
    List<Contest> listContest =
        await contestRepository.getListSignficantContest();
    _listContestFetcher.sink.add(listContest);
  }

  //get contest detail by id
  getContestDetail(int id) async {
    Contest contestDetail = await contestRepository.getContestDetail(id);
    _contestDetailFetcher.sink.add(contestDetail);
  }

  dispose() {
    _listContestFetcher.close();
    _contestDetailFetcher.close();
  }
}

final contestBloc = ContestBloc();
