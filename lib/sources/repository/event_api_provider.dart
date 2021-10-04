import 'dart:convert';

import 'package:car_world_system/sources/model/event.dart';
import 'package:car_world_system/sources/model/proposal.dart';
import 'package:car_world_system/sources/model/userEvent.dart';
import 'package:car_world_system/sources/repository/event_api_string.dart';
import 'package:http/http.dart' as http;

class EventApiProvider {
  // get all new event
  Future<List<Event>> getListNewEvent() async {
    final response = await http.get(EventApiString.getListNewEvent());
    List<Event> listEvent = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      //if (data['IsDeleted'] == false) {
      Event event = Event(
          id: data['Id'],
          createdBy: data['CreatedBy'],
          title: data['Title'],
          description: data['Description'],
          venue: data['Venue'],
          image: data['Image'],
          minParticipants: data['MinParticipants'],
          maxParticipants: data['MaxParticipants'],
          startRegister: data['StartRegister'],
          endRegister: data['EndRegister'],
          startDate: data['StartDate'],
          endDate: data['EndDate'],
          currentParticipants: data['CurrentParticipants'],
          rating: data['Rating'],
          status: data['Status'],
          createdDate: data['CreatedDate']);
      listEvent.add(event);
      // }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return listEvent;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list new event');
    }
  }

  // get all significant event
  Future<List<Event>> getListSignificantEvent() async {
    final response = await http.get(EventApiString.getListSignnificantEvent());
    List<Event> listEvent = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      //if (data['IsDeleted'] == false) {
      Event event = Event(
          id: data['Id'],
          createdBy: data['CreatedBy'],
          title: data['Title'],
          description: data['Description'],
          venue: data['Venue'],
          image: data['Image'],
          minParticipants: data['MinParticipants'],
          maxParticipants: data['MaxParticipants'],
          startRegister: data['StartRegister'],
          endRegister: data['EndRegister'],
          startDate: data['StartDate'],
          endDate: data['EndDate'],
          currentParticipants: data['CurrentParticipants'],
          rating: data['Rating'],
          status: data['Status'],
          createdDate: data['CreatedDate']);
      listEvent.add(event);
      // }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return listEvent;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list significant event');
    }
  }

  //get event detail by id
  Future<Event> getEventDetail(int id) async {
    final response = await http.get(EventApiString.getEventDetail(id));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return Event.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load event detail');
    }
  }

  //create proposal
  Future<Proposal> createProposal(Proposal proposal) async {
    final response = await http.post(
      EventApiString.createProposal(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(proposal),
    );
    if (response.statusCode == 200) {
      print("thanh cong");

      // final Map<String, dynamic> data = json.decode(response.body);

      // Proposal responseProposal = Proposal.fromJson(data);

      // return responseProposal;
      print(response.body);
      return Proposal.fromJson(jsonDecode(response.body)); // có lỗi chỗ này
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create proposal.');
    }
  }

  //register event
  Future<UserEvent> registerEvent(UserEvent userEvent) async {
    final response = await http.post(
      EventApiString.registerEvent(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(userEvent),
    );
    if (response.statusCode == 200) {
      print("thanh cong");

      
      return UserEvent.fromJson(jsonDecode(response.body)); 
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      
      throw Exception('Failed to user register event.');
    }
  }
}
