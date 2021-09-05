import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/main/home/proposal_screen.dart';
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
        backgroundColor: AppConstant.backgroundColor,
      ),
      body: ListView(
        children: <Widget>[slider(), TabBar_Event_Contest_Screen()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProposalScreen(),
              ));
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
        backgroundColor: AppConstant.backgroundColor,
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
      autoPlayInterval: 5000,
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
