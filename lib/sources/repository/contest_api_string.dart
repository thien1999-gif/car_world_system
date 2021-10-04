const String BASE_URL = "https://carworld.cosplane.asia";

class ContestApiString {
  //get all new contest
  //https://carworld.cosplane.asia/api/contest/GetAllNewContests
  static String getListNewEvent() {
    return BASE_URL + '/api/contest/GetAllNewContests';
  }

  //get all significant contest
  //https://carworld.cosplane.asia/api/contest/GetAllSignificantContests
  static String getListSignificantEvent() {
    return BASE_URL + '/api/contest/GetAllSignificantContests';
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