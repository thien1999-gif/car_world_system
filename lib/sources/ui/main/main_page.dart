import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/main/exchange/exchange_screen.dart';
import 'package:car_world_system/sources/ui/main/home/home_screen.dart';
import 'package:car_world_system/sources/ui/main/profile/profile_screen.dart';
import 'package:car_world_system/sources/ui/main/search/search_car_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    Exchange(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppConstant.backgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap:_onItemTapped,
        items: [
          BottomNavigationBarItem(
            title: Text('Trang chủ'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Tìm kiếm'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Trao đổi'),
            icon: Icon(Icons.directions_car),
          ),
          BottomNavigationBarItem(
            title: Text('Cá nhân'),
            icon: Icon(Icons.account_box
          ),)
        ]
      ),
      
    );
  }
}
