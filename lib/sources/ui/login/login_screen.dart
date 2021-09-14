import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/repository/google_sign_in.dart';
import 'package:car_world_system/sources/ui/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/background_image.png"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.0.h),
                Text(
                  "Nơi thể hiện đẳng cấp ",
                  style: GoogleFonts.getFont("Pacifico",
                      textStyle:
                          TextStyle(color: Colors.white, fontSize: 15.0.sp)),
                ),
                Text(
                  "và thỏa mãn đam mê của bạn ",
                  style: GoogleFonts.getFont("Pacifico",
                      textStyle:
                          TextStyle(color: Colors.white, fontSize: 15.0.sp)),
                ),
                SizedBox(height: 71.0.h //It will take a 30% of screen height
                    ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        minimumSize: Size(double.infinity, 50)),
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    label: Text("Đăng nhập với Google"),
                    onPressed: () {
                      

                      GoogleSingInProvider.signInWithGoogle().then((result) {
                        if (result != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
