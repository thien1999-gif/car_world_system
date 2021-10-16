import 'package:car_world_system/sources/model/cancel_register_contest.dart';
import 'package:car_world_system/sources/model/contest.dart';
import 'package:car_world_system/sources/model/contest_register.dart';
import 'package:car_world_system/sources/model/feedback.dart';
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
  //rating contest
  Future<bool> ratingContest(double rate, UserContest userContest) {
    return contestApiProvider.ratingContest(rate, userContest);
  }

  //feedback contest
  Future<bool> feedbackContest(int id, FeedBack feedback){
    return contestApiProvider.feedbackContest(id, feedback);
  }

  //cancel contest
  Future<bool> cancelContest(CancelRegisterContest userContest) {
    return contestApiProvider.cancelContest(userContest);
  }
  //get list contest user register
  Future<List<ContestRegister>> getListContestUserRegister(int id) {
    return contestApiProvider.getListContestUserRegister(id);
  }

  //get list contest user joined
  Future<List<ContestRegister>> getListContestUserJoined(int id) {
    return contestApiProvider.getListContestUserJoined(id);
  }
}
