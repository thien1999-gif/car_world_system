import 'package:car_world_system/sources/ui/main/home/tabbar_event_contest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  //do some thing here
                },
                child: Icon(
                  Icons.notifications,
                  size: 26.0,
                ),
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[slider(), TabBar_Event_Contest_Screen()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //do some thing here
        },
        child: Column(
          children: [Icon(Icons.add), Text("Đề nghị")],
        ),
        isExtended: true,
      ),
    );
  }

  Widget slider() {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      autoPlayInterval: 4000,
      isLoop: true,
      children: [
        Image(
          image: AssetImage("assets/images/slider_1.png"),
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage("assets/images/slider_2.png"),
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage("assets/images/slider_3.png"),
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage("assets/images/slider_4.png"),
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
