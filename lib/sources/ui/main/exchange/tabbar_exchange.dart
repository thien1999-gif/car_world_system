import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/model/user_information.dart';
import 'package:car_world_system/sources/repository/login_repository.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:car_world_system/sources/ui/main/exchange/accessory_post_screen.dart';
import 'package:car_world_system/sources/ui/main/exchange/car_post_screen.dart';
import 'package:car_world_system/sources/ui/main/exchange/exchange_accessory_screen.dart';
import 'package:car_world_system/sources/ui/main/exchange/exchange_car_screen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class TabbarExchangeScreen extends StatefulWidget {
  const TabbarExchangeScreen({Key? key}) : super(key: key);

  @override
  _TabbarExchangeScreenState createState() => _TabbarExchangeScreenState();
}

// bool _isEnableLocation = true;
// double longitude = 0, latitude = 0;

class _TabbarExchangeScreenState extends State<TabbarExchangeScreen> {
  bool _enable = true;
  UserInformation? _profile;
  @override
  void initState() {
    super.initState();
    getUserInformation();
  }

  void getUserInformation() async {
    // LoginApiProvider user = new LoginApiProvider();
    LoginRepository loginRepository = LoginRepository();
    var profile = await loginRepository.getUserInformation(email);
    setState(() {
      _profile = profile;
    });
    if (_profile!.exchangePost >= 3) {
      _enable = false;
    } else {
      _enable = true;
    }
  }
  // Location location = new Location();
  // late bool _serviceEnable;
  // late PermissionStatus _permissionGranted;
  // late LocationData _locationData;

  // bool _isListenLocation = false, _isGetLocation = false;
  // void initState() {
  //   super.initState();
  //   if (_isEnableLocation == true) {
  //     _showDialog();
  //   }
  // }

  // _showDialog() async {
  //   await Future.delayed(Duration(milliseconds: 50));
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             title: Text('Vị trí'),
  //             content: Text('Cho phép lấy vị trí của bạn ?'),
  //             actions: <Widget>[
  //               FlatButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text('Không', style: TextStyle(color: Colors.white)),
  //                   color: AppConstant.backgroundColor),
  //               FlatButton(
  //                   onPressed: () async {
  //                     _serviceEnable = await location.serviceEnabled();
  //                     if (!_serviceEnable) {
  //                       _serviceEnable = await location.requestService();
  //                       if (_serviceEnable) return;
  //                     }

  //                     _permissionGranted = await location.hasPermission();
  //                     if (_permissionGranted == PermissionStatus.denied) {
  //                       _permissionGranted = await location.requestPermission();
  //                       if (_permissionGranted != PermissionStatus.granted)
  //                         return;
  //                     }

  //                     _locationData = await location.getLocation();
  //                     longitude = _locationData.longitude;
  //                     latitude = _locationData.latitude;
  //                     print("long: " + longitude.toString());
  //                     print("lati: " + latitude.toString());
  //                     setState(() {
  //                       _isEnableLocation = false;
  //                     });
  //                     Navigator.pop(context);
  //                   },
  //                   child:
  //                       Text('Cho phép', style: TextStyle(color: Colors.white)),
  //                   color: AppConstant.backgroundColor),
  //             ],
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.backgroundColor,
            title: Text('Trao đổi'),
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
          floatingActionButton: FloatingActionButton(
            onPressed: _enable
                ? () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Đăng tin'),
                          content: Text('Bạn muốn trao đổi.'),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CarPostScreen(),
                                      ));
                                },
                                child: Text('Xe hơi',
                                    style: TextStyle(color: Colors.white)),
                                color: AppConstant.backgroundColor),
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AccessoryPostScreen(),
                                      ));
                                },
                                child: Text('Linh kiện',
                                    style: TextStyle(color: Colors.white)),
                                color: AppConstant.backgroundColor),
                          ],
                        );
                      },
                    );
                  }
                : () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Đăng tin'),
                          content: Container(
                            width: 100,
                            height: 105,
                            child: Column(
                              children: [
                                Text(
                                  "Lưu ý",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "Bạn chỉ có thể đăng tối đa 3 sản phẩm. Vì vậy bạn cần phải bán hết tất cả sản phẩm trong tài khoản của bạn hoặc hủy thì bạn mới có thể tiếp tục đăng bài",
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Đóng',
                                    style: TextStyle(color: Colors.white)),
                                color: AppConstant.backgroundColor),
                          ],
                        );
                      },
                    );
                  },
            child: Icon(
              Icons.add,
              size: 35,
            ),
            backgroundColor: AppConstant.backgroundColor,
          ),
          body: TabBarView(
            children: [ExchangeCarScreen(), ExchangeAccessoryScreen()],
          ),
        ),
      ),
    );
  }
}
