import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/main/home/proposal_screen.dart';
import 'package:car_world_system/sources/ui/main/home/tabbar_event_contest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Image(
              image: AssetImage('assets/images/logo.jpg'),
              fit: BoxFit.cover,
            ),
          )),
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
      height: 150,
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
