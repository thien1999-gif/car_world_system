import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/main/drawer/drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin cá nhân"),
        backgroundColor: AppConstant.backgroundColor,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: Center(
        child: Text("Cá nhân"),
      ),
    );
  }
}
