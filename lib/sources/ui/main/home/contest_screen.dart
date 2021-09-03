import 'package:flutter/material.dart';
class ContestScreen extends StatefulWidget {
  const ContestScreen({ Key? key }) : super(key: key);

  @override
  _ContestScreenState createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Cuộc thi"),),
    );
  }
}