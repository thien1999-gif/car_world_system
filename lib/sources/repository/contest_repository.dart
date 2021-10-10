import 'package:car_world_system/sources/model/contest.dart';
import 'package:car_world_system/sources/model/userContest.dart';
import 'package:car_world_system/sources/repository/contest_api_provider.dart';

class ContestRepository {
  ContestApiProvider contestApiProvider = ContestApiProvider();

  //get list all contest
  Future<List<Contest>> getListNewContest(String now) {
    return contestApiProvider.getListNewContest(now);
  }
  //get list significant contest
  Future<List<Contest>> getListSignficantContest(String now) {
    return contestApiProvider.getListSignificantContest(now);
  }
  //get contest detail by id
  Future<Contest> getContestDetail(int id) {
    return contestApiProvider.getContestDetail(id);
  }

  //register contest
   Future<bool> registerContest(UserContest userContest) {
    return contestApiProvider.registerContest(userContest);
  }
}
