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
}

// https://carworld.cosplane.asia/api/userContest/CancelRegisterContest