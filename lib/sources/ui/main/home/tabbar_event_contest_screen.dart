import 'package:car_world_system/sources/ui/main/home/contest_screen.dart';
import 'package:car_world_system/sources/ui/main/home/event_screen.dart';
import 'package:flutter/material.dart';

class TabBar_Event_Contest_Screen extends StatefulWidget {
  const TabBar_Event_Contest_Screen({ Key? key }) : super(key: key);

  @override
  _TabBar_Event_Contest_ScreenState createState() => _TabBar_Event_Contest_ScreenState();
}

class _TabBar_Event_Contest_ScreenState extends State<TabBar_Event_Contest_Screen> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.blue,
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      tabs: 
                      [Column(children: [
                        Icon(Icons.event, size: 35,),
                        Text("Sự kiện")
                      ],), Column(children: [
                        Icon(Icons.sports_kabaddi, size: 36,),
                        Text("Cuộc thi")
                      ],)],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              EventScreen(),
              ContestScreen()
            ],
          ),
        ),
      ),
    );
  }
}