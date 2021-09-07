import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/main/search/search_accessory_screen.dart';
import 'package:car_world_system/sources/ui/main/search/search_car_screen.dart';
import 'package:flutter/material.dart';
class Tabbar_Search extends StatefulWidget {
  const Tabbar_Search({ Key? key }) : super(key: key);

  @override
  _Tabbar_SearchState createState() => _Tabbar_SearchState();
}

class _Tabbar_SearchState extends State<Tabbar_Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.backgroundColor,
            title: Text('Tìm kiếm'),
            automaticallyImplyLeading: false,
            centerTitle: true,
            bottom: TabBar(
               indicatorColor: Color.fromRGBO(255, 255, 255, 1),
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: "Xe hơi"),
                Tab(
                    icon: Icon(Icons.settings_input_component),
                    text: "Linh kiện")
              ],
            ),
          ),
          body: TabBarView(
            children: [SearchCarScreen(),SearchAccessoryScreen()],
          ),
        ),
      ),
    );
  }
}