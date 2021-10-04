import 'dart:convert';

import 'package:car_world_system/sources/model/userLogin.dart';
import 'package:car_world_system/sources/model/userProfile.dart';
import 'package:car_world_system/sources/repository/login_api_string.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class LoginApiProvider {
  Future<UserLogin> login(UserLogin user) async {
    final response = await http.post(
      LoginApiString.login(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(user),
    );
    if (response.statusCode == 200) {
      //print("thanh cong");
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      final Map<String, dynamic> data = json.decode(response.body);
      //print("Loi " + dataUser["User"].toString());
      //final Map<String, dynamic> data =
      // json.decode(dataUser["User"].toString());
      UserLogin responseUserLogin = UserLogin.fromJson(data);
      //prefs.setInt("UserId", responseUserLogin.id);
      //print(response.body);
      return responseUserLogin;
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Login.');
    }
  }

  Future<UserProfile> getProfile(String email) async {
    final response = await http.get(LoginApiString.getProfile(email));
    print("HIHI " + response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserProfile userProfile = UserProfile(
          id: data['Id'],
          email: data['Email'],
          fullName: data['FullName'],
          image: data['Image'],
          phone: data['Phone'],
          address: data['Address'],
          latitude: data['Latitude'],
          longtitude: data['Longitude'],
          exchangePost: data['ExchangePost'],
          tokenMobile: data['TokenMobile']);
      print(userProfile.id);
      // final Map<String, dynamic> data = json.decode(response.body);
      // UserProfile reponseUserProfile = UserProfile.fromJson(data);
      return userProfile;
    } else {
      print("Bach: " + LoginApiString.getProfile(email));
      throw Exception('Failed to get profile user.');
    }
  }
}
