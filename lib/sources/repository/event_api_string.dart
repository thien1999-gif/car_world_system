const String BASE_URL = "https://carworld.cosplane.asia";

class EventApiString {
  //get all new event
  //https://carworld.cosplane.asia/api/event/GetAllNewEvents
  static String getListNewEvent() {
    return BASE_URL + '/api/event/GetAllNewEvents';
  }

  //get all signnificant event
  //https://carworld.cosplane.asia/api/event/GetAllSignificantEvents
  static String getListSignnificantEvent() {
    return BASE_URL + '/api/event/GetAllSignificantEvents';
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
  // https://carworld.cosplane.asia/api/userEvent/RegisterEvent
  static String registerEvent() {
    return BASE_URL + '/api/userEvent/RegisterEvent';
  }
}

// https://carworld.cosplane.asia/api/userEvent/CancelRegisterEvent