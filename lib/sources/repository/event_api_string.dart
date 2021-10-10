const String BASE_URL = "https://carworld.cosplane.asia";

class EventApiString {
  //get all new event
  //https://carworld.cosplane.asia/api/event/GetNewEvents?now=2021-10-10T09%3A35%3A03.256Z
  static String getListNewEvent(String now) {
    return BASE_URL + '/api/event/GetNewEvents?now=$now';
  }

  //get all signnificant event
  //https://carworld.cosplane.asia/api/event/GetSignificantEvents?now=2021-10-10T09%3A35%3A03.256Z
  static String getListSignnificantEvent(String now) {
    return BASE_URL + '/api/event/GetSignificantEvents?now=$now';
  }

  //get event detail
  //https://carworld.cosplane.asia/api/event/GetEventById?id=5
  static String getEventDetail(int id) {
    return BASE_URL + '/api/event/GetEventById?id=$id';
  }

  // create proposal
  //https://carworld.cosplane.asia/api/proposal/CreateNewProposal
  static String createProposal() {
    return BASE_URL + '/api/proposal/CreateNewProposal';
  }

  //user register event

  static String registerEvent() {
    return BASE_URL + '/api/userEvent/RegisterEvent';
  }

  //user cancel event

  static String cancelEvent() {
    return BASE_URL + '/api/userEvent/CancelRegisterEvent';
  }

  //get list proposal of user send for manager
  //https://carworld.cosplane.asia/api/proposal/GetProposalsUserSubmited?userId=18
  static String getListProposalOfUser(int id) {
    return BASE_URL + '/api/proposal/GetProposalsUserSubmited?userId=$id';
  }

  //get list event of user register
  //https://carworld.cosplane.asia/api/userEvent/GetEventsRegistered?userId=18
  static String getListEventUserRegister(int id) {
    return BASE_URL + '/api/userEvent/GetEventsRegistered?userId=$id';
  }

  //get list event of user joined
  //https://carworld.cosplane.asia/api/userEvent/GetEventsJoined?userId=19
  static String getListEventUserJoined(int id) {
    return BASE_URL + '/api/userEvent/GetEventsJoined?userId=$id';
  }

  //get proposal detail
  //https://carworld.cosplane.asia/api/proposal/GetProposalById?id=7

  static String getProposalDetail(int id) {
    return BASE_URL + '/api/proposal/GetProposalById?id=$id';
  }

  //user rating event
  //https://carworld.cosplane.asia/api/userEvent/EvaluateEvent?evaluation=4
  static String ratingEvent(double rate) {
    return BASE_URL + '/api/userEvent/EvaluateEvent?evaluation=$rate';
  }

  //user feedback event
  //https://carworld.cosplane.asia/api/feedback/FeedbackEvent?eventId=1
  static String feedbackEvent(int id) {
    return BASE_URL + '/api/feedback/FeedbackEvent?eventId=$id';
  }
}
