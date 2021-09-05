import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          color: AppConstant.backgroundColor,
          home: LoginScreen(),
        );
      },
    );
  }
}
