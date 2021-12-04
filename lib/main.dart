// @dart=2.9
import 'dart:io';
import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/login/first_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User & Admin Login';

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          color: AppConstant.backgroundColor,
          theme: ThemeData(
            colorScheme: const ColorScheme.light(),
            //scaffoldBackgroundColor: Colors.blue.shade300,
            accentColor: Colors.indigoAccent.withOpacity(0.8),
            //unselectedWidgetColor: Colors.blue.shade200,
            switchTheme: SwitchThemeData(
              thumbColor: MaterialStateProperty.all(Colors.black),
            ),
          ),
          home: FirstPage(),
        );
      },
    );

    // MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: title,
    //     theme: ThemeData(
    //       colorScheme: const ColorScheme.dark(),
    //       //scaffoldBackgroundColor: Colors.blue.shade300,
    //       accentColor: Colors.indigoAccent.withOpacity(0.8),
    //       //unselectedWidgetColor: Colors.blue.shade200,
    //       switchTheme: SwitchThemeData(
    //         thumbColor: MaterialStateProperty.all(Colors.white),
    //       ),
    //     ),
    //     home: FirstPage(),
    //   );
  }
}
