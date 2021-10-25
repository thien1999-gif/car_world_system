import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/exchange_bloc.dart';
import 'package:car_world_system/sources/model/userProfile.dart';
import 'package:car_world_system/sources/model/user_exchange_response.dart';
import 'package:car_world_system/sources/repository/login_repository.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ListUserWantToExchangeScreen extends StatefulWidget {
  final String exchangeID;
  const ListUserWantToExchangeScreen({Key? key, required this.exchangeID})
      : super(key: key);

  @override
  _ListUserWantToExchangeScreenState createState() =>
      _ListUserWantToExchangeScreenState(exchangeID);
}

class _ListUserWantToExchangeScreenState
    extends State<ListUserWantToExchangeScreen> {
  final String exchangeID;

  _ListUserWantToExchangeScreenState(this.exchangeID);
  UserProfile? _profile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  void getProfile() async {
    // LoginApiProvider user = new LoginApiProvider();
    LoginRepository loginRepository = LoginRepository();
    var profile = await loginRepository.getProfile(email);
    setState(() {
      _profile = profile;
    });
  }

  final formatCurrency = new NumberFormat.currency(locale: "vi_VN", symbol: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.backgroundColor,
        title: Text('Người quan tâm'),
        centerTitle: true,
      ),
      body: _loadListExchangeAccessoryOfUser(),
    );
  }

  Widget _loadListExchangeAccessoryOfUser() {
    if (_profile == null) {
      return Container();
    } else {
      exchangeBloc.getListUserWattoExchange(exchangeID);
      return StreamBuilder(
          stream: exchangeBloc.listUserExchangeResponse,
          builder:
              (context, AsyncSnapshot<List<UserExchangeResponse>> snapshot) {
            if (snapshot.hasData) {
              return _buildList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    }
  }

  Widget _buildList(List<UserExchangeResponse> data) {
    if (data.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 55.h,
              width: 100.h,
              child: Image(
                image: AssetImage("assets/images/not found.png"),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Xin lỗi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                "chúng tôi không thể tìm được kết quả hợp với tìm kiếm của bạn")
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Thông tin chi tiết'),
                        content: Container(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 15,
                                    color: Colors.lightGreen,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      child: Text(
                                        data[index].user.fullName.length > 30
                                            ? data[index]
                                                    .user
                                                    .fullName
                                                    .substring(0, 28) +
                                                "..."
                                            : data[index].user.fullName,
                                      ),
                                      width: 28.h)
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 15,
                                    color: Colors.lightGreen,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    data[index].createdDate.substring(11, 16) +
                                        "/" +
                                        data[index]
                                            .createdDate
                                            .substring(0, 10),
                                    style: TextStyle(fontSize: 15),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: 15,
                                    color: Colors.lightGreen,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("0963852741"),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    size: 15,
                                    color: Colors.lightGreen,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "quận 9 thành phố Hồ Chí Minh",
                                    style: TextStyle(fontSize: 15),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.message,
                                    size: 15,
                                    color: Colors.lightGreen,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Tin nhắn",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(data[index].message),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Không',
                                  style: TextStyle(color: Colors.white)),
                              color: AppConstant.backgroundColor),
                          FlatButton(
                              onPressed: () {
                                // ExchangeAccessoryRepository exchangeAccessoryRepository = ExchangeAccessoryRepository();
                                // exchangeAccessoryRepository.cancelExchangeAccessory(data.id);
                                //  SnackBar snackbar =
                                //           SnackBar(content: Text('Hủy thành công'));
                                //       ScaffoldMessenger.of(context)
                                //           .showSnackBar(snackbar);
                                //       Navigator.pop(context);
                                //       Navigator.pop(context);
                              },
                              child: Text('Trao đổi',
                                  style: TextStyle(color: Colors.white)),
                              color: AppConstant.backgroundColor),
                        ],
                      ),
                    );
                  },
                  child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Container(
                        height: 13.h,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    width: 14.h,
                                    height: 12.5.h,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.0)),
                                      shape: BoxShape.rectangle,
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              data[index].user.image)),
                                    )),
                              ],
                            ),
                            Container(
                              width: 1.0.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.people,
                                      size: 15,
                                      color: Colors.lightGreen,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        child: Text(
                                          data[index].user.fullName.length > 30
                                              ? data[index]
                                                      .user
                                                      .fullName
                                                      .substring(0, 28) +
                                                  "..."
                                              : data[index].user.fullName,
                                          style: TextStyle(
                                              fontWeight: AppConstant.titleBold,
                                              fontSize: 15),
                                        ),
                                        width: 29.h)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 15,
                                      color: Colors.lightGreen,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      data[index]
                                              .createdDate
                                              .substring(11, 16) +
                                          "/" +
                                          data[index]
                                              .createdDate
                                              .substring(0, 10),
                                      style: TextStyle(fontSize: 15),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: SizedBox(
                                        width: 17.h,
                                      ),
                                    ),
                                    Row(children: <Widget>[
                                      Text(
                                        "Xem chi tiết",
                                        style: TextStyle(
                                            color: AppConstant.backgroundColor,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Icon(
                                        Icons.view_carousel,
                                        color: AppConstant.backgroundColor,
                                      ),
                                    ])
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.0))),
                      )));
            }),
      );
    }
  }
}
