import 'package:flutter/material.dart';
class EventScreen extends StatefulWidget {
  const EventScreen({ Key? key }) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Sự kiện"),),
    );
  }
}