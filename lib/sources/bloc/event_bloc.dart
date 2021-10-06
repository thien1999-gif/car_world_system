import 'package:car_world_system/sources/model/event.dart';
import 'package:car_world_system/sources/model/listProposal.dart';
import 'package:car_world_system/sources/repository/event_repository.dart';
import 'package:rxdart/rxdart.dart';

class EventBloc {
  final EventRepository eventRepository = EventRepository();

  final _listEventFetcher = PublishSubject<List<Event>>();
  final _listProposalOfUserFetcher = PublishSubject<List<ListProposal>>();
  final _eventDetailFetcher = PublishSubject<Event>();

  Observable<List<Event>> get listEvent => _listEventFetcher.stream;
  Observable<List<ListProposal>> get listProposalOfUser => _listProposalOfUserFetcher.stream;
  Observable<Event> get eventDetail => _eventDetailFetcher.stream;
  //get list new event
  getListNewEvent() async {
    List<Event> listEvent = await eventRepository.getListNewEvent();
    _listEventFetcher.sink.add(listEvent);
  }

  //get list significant event
  getListSignificantEvent() async {
    List<Event> listEvent = await eventRepository.getListSignificantEvent();
    _listEventFetcher.sink.add(listEvent);
  }

 //get list proposal of user
  getListProposalOfUser(int id) async {
    List<ListProposal> listProposal = await eventRepository.getListProposalOfUser(id);
    _listProposalOfUserFetcher.sink.add(listProposal);
  }
  //get event detail by id
  getEventDetail(int id) async {
    Event eventDetail = await eventRepository.getEventDetail(id);
    _eventDetailFetcher.sink.add(eventDetail);
  }

  dispose() {
    _listEventFetcher.close();
    _eventDetailFetcher.close();
    _listProposalOfUserFetcher.close();
  }
}

final eventBloc = EventBloc();
