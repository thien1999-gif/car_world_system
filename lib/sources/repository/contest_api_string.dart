const String BASE_URL = "https://carworld.cosplane.asia";

class ContestApiString {
  //get all new contest
  //https://carworld.cosplane.asia/api/contest/GetNewContests?now=2021-10-10T05%3A02%3A29.429Z
  static String getListNewEvent(String now) {
    return BASE_URL + '/api/contest/GetNewContests?now=$now';
  }

  //get all significant contest
  //https://carworld.cosplane.asia/api/contest/GetSignificantContests?now=2021-10-10T05%3A02%3A29.429Z
  static String getListSignificantEvent(String now) {
    return BASE_URL + '/api/contest/GetSignificantContests?now=$now';
  }

  //get contest detail
  //https://carworld.cosplane.asia/api/contest/GetContestById?id=1
  static String getContestDetail(int id) {
    return BASE_URL + '/api/contest/GetContestById?id=$id';
  }

  //user register contest
  // https://carworld.cosplane.asia/api/userContest/RegisterContest
  static String registerContest() {
    return BASE_URL + '/api/userContest/RegisterContest';
  }

  //user cancel contest
//https://carworld.cosplane.asia/api/userContest/CancelRegisterContest
  static String cancelContest() {
    return BASE_URL + '/api/userContest/CancelRegisterContest';
  }

  //get list contest of user register
  //https://carworld.cosplane.asia/api/userContest/GetContestsRegistered?userId=1
  static String getListContestUserRegister(int id) {
    return BASE_URL + '/api/userContest/GetContestsRegistered?userId=$id';
  }

  //get list contest of user joined
  // https://carworld.cosplane.asia/api/userContest/GetContestsJoined?userId=1
  static String getListContestUserJoined(int id) {
    return BASE_URL + '/api/userContest/GetContestsJoined?userId=$id';
  }

  //user rating contest
  //https://carworld.cosplane.asia/api/userContest/EvaluateContest?evaluation=1
  static String ratingContest(double rate) {
    return BASE_URL + '/api/userContest/EvaluateContest?evaluation=$rate';
  }

  //user feedback contest
  //https://carworld.cosplane.asia/api/feedback/FeedbackContest?contestId=1
  static String feedbackContest(int id) {
    return BASE_URL + '/api/feedback/FeedbackContest?contestId=$id';
  }
}
