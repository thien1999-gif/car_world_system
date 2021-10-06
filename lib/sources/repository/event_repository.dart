
import 'package:car_world_system/sources/model/event.dart';
import 'package:car_world_system/sources/model/listProposal.dart';
import 'package:car_world_system/sources/model/proposal.dart';
import 'package:car_world_system/sources/model/userEvent.dart';
import 'package:car_world_system/sources/repository/event_api_provider.dart';

class EventRepository {
  EventApiProvider eventApiProvider = EventApiProvider();

  //get list new event
  Future<List<Event>> getListNewEvent() {
    return eventApiProvider.getListNewEvent();
  }

 //get list significant event
  Future<List<Event>> getListSignificantEvent() {
    return eventApiProvider.getListSignificantEvent();
  }
  //get event detail by id
  Future<Event> getEventDetail(int id) {
    return eventApiProvider.getEventDetail(id);
  }

  //create proposal
   Future<Proposal> createProposal(Proposal proposal) {
    return eventApiProvider.createProposal(proposal);
  }
   //register event
   Future<UserEvent> registerEvent(UserEvent userEvent) {
    return eventApiProvider.registerEvent(userEvent);
  }

  //get list proposal of user
  Future<List<ListProposal>> getListProposalOfUser(int id) {
    return eventApiProvider.getListProposalOfUser(id);
  }
}
