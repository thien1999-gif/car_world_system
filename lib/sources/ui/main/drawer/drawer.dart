import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/main/drawer/contest/manager_contest_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/event/manager_event_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/exchange/history_exchange_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/exchange/manager_post_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/proposal/manager_proposal_screen.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Abhishek Mishra"),
            accountEmail: Text("abhishekm977@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: BoxDecoration(
              color: AppConstant.backgroundColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text("Sự kiện đã tham gia và đăng ký"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagerEventScreen(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.sports_kabaddi),
            title: Text("Cuộc thi đã tham gia và đăng ký"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagerContestScreen(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.note_add),
            title: Text("Ý tưởng đã gửi"),
            onTap: () {
              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ManagerProposalScreen(),
                          ));
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Lịch sử trao đổi"),
            onTap: () {
              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryExchangeScreen(),
                          ));
            },
          ),
          ListTile(
            leading: Icon(Icons.manage_search),
            title: Text("Quản lý bài đăng"),
            onTap: () {
              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ManagerPostScreen(),
                          ));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Đăng xuất"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
