const String BASE_URL = "https://carworld.cosplane.asia";

class EventApiString {
  //get all event
  //https://carworld.cosplane.asia/api/event/GetAllEvents
  static String getListEvent() {
    return BASE_URL + '/api/event/GetAllEvents';
  }
}
