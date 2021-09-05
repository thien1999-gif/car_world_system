import 'package:car_world_system/constant/app_constant.dart';
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
              color:AppConstant.backgroundColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text("Sự kiện đã tham gia và đăng ký"),
            onTap: () {
             
            },
          ),
           ListTile(
            leading: Icon(Icons.sports_kabaddi),
            title: Text("Cuộc thi đã tham gia và đăng ký"),
            onTap: () {
             
            },
          ),
           ListTile(
            leading: Icon(Icons.note_add),
            title: Text("Ý tưởng đã gửi"),
            onTap: () {
             
            },
          ),
           ListTile(
            leading: Icon(Icons.history),
            title: Text("Lịch sử trao đổi"),
            onTap: () {
             
            },
          ),
           ListTile(
            leading: Icon(Icons.manage_search),
            title: Text("Quản lý bài đăng"),
            onTap: () {
             
            },
          ),
           ListTile(
            leading: Icon(Icons.logout),
            title: Text("Đăng xuất"),
            onTap: () {
             
            },
          ),
        ],
      ),
    );
  }
}
