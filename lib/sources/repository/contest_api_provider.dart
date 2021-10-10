import 'dart:convert';

import 'package:car_world_system/sources/model/contest.dart';
import 'package:car_world_system/sources/model/userContest.dart';
import 'package:car_world_system/sources/repository/contest_api_string.dart';
import 'package:http/http.dart' as http;

class ContestApiProvider {
  // get all new contest
  Future<List<Contest>> getListNewContest(String now) async {
    final response = await http.get(ContestApiString.getListNewEvent(now));
    List<Contest> listContest = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      //if (data['IsDeleted'] == false) {
      Contest contest = Contest(
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
          fee: data['Fee'],
          currentParticipants: data['CurrentParticipants'],
          rating: data['Rating'],
          status: data['Status'],
          createdDate: data['CreatedDate']);
      listContest.add(contest);
      // }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return listContest;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list new contest');
    }
  }

// get all significant contest
  Future<List<Contest>> getListSignificantContest(String now) async {
    final response = await http.get(ContestApiString.getListSignificantEvent(now));
    List<Contest> listContest = [];
    var jsonData = jsonDecode(response.body);
    for (var data in jsonData) {
      //if (data['IsDeleted'] == false) {
      Contest contest = Contest(
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
          fee: data['Fee'],
          currentParticipants: data['CurrentParticipants'],
          rating: data['Rating'],
          status: data['Status'],
          createdDate: data['CreatedDate']);
      listContest.add(contest);
      // }
    }

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return listContest;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load list significant contest');
    }
  }

  //get contest detail by id
  Future<Contest> getContestDetail(int id) async {
    final response = await http.get(ContestApiString.getContestDetail(id));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return Contest.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load contest detail');
    }
  }

  //register contest
  Future<bool> registerContest(UserContest userContest) async {
    final response = await http.post(
      ContestApiString.registerContest(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(userContest),
    );
    if (response.statusCode == 200) {
      print("thanh cong dang ký cuoc thi");

      return true;
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      return false;
    }
  }
}
