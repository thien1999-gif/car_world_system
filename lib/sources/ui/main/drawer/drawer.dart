import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/model/userLogin.dart';
import 'package:car_world_system/sources/model/userProfile.dart';
import 'package:car_world_system/sources/repository/google_sign_in.dart';
import 'package:car_world_system/sources/repository/login_api_provider.dart';
import 'package:car_world_system/sources/repository/login_repository.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/contest/manager_contest_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/event/manager_event_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/exchange/history_exchange_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/exchange/manager_post_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/feedback/view_feedback.dart';
import 'package:car_world_system/sources/ui/main/drawer/proposal/manager_proposal_screen.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  UserProfile? _profile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  void getProfile() async {
    // LoginApiProvider user = new LoginApiProvider();
    LoginRepository loginRepository = LoginRepository();
    var profile = await loginRepository.getProfile(email);
    setState(() {
      _profile = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Email ne " + email);
    if (_profile == null) {
      return Container();
    } else {
      return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(_profile!.fullName),
              accountEmail: Text(_profile!.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(_profile!.image),
              ),
              decoration: BoxDecoration(
                color: AppConstant.backgroundColor,
              ),
            ),
            ListTile(
              leading: Icon(Icons.event,color: Colors.lightGreen,),
              title: Text("S??? ki???n ???? tham gia v?? ????ng k??"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManagerEventScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_kabaddi,color: Colors.lightGreen,),
              title: Text("Cu???c thi ???? tham gia v?? ????ng k??"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManagerContestScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.note_add,color: Colors.lightGreen,),
              title: Text("?? t?????ng ???? g???i"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManagerProposalScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.history,color: Colors.lightGreen,),
              title: Text("L???ch s??? trao ?????i"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryExchangeScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback,color: Colors.lightGreen,),
              title: Text("Xem ph???n h???i"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewFeedback(),
                    ));
              },
            ),
              ListTile(
              leading: Icon(Icons.manage_search,color: Colors.lightGreen,),
              title: Text("Qu???n l?? b??i ????ng"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManagerPostScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.lightGreen,),
              title: Text("????ng xu???t"),
              onTap: () {
                GoogleSingInProvider.signOutGoogle();
                // userEmail = "";
                // email = "";
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
            ),
          ],
        ),
      );
    }
    //UserProfile profile = user.getProfile(userEmail) as UserProfile;
  }
}
