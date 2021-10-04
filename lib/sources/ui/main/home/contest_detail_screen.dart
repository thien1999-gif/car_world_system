import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/contest_bloc.dart';
import 'package:car_world_system/sources/model/contest.dart';
import 'package:car_world_system/sources/model/userContest.dart';
import 'package:car_world_system/sources/model/userProfile.dart';
import 'package:car_world_system/sources/repository/contest_repository.dart';
import 'package:car_world_system/sources/repository/login_repository.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContestDetailScreen extends StatefulWidget {
  final int id;
  const ContestDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ContestDetailScreenState createState() => _ContestDetailScreenState(id);
}

class _ContestDetailScreenState extends State<ContestDetailScreen> {
  final int id;
  UserProfile? _profile;
  @override
  void initState() {
    super.initState();
    getProfile();
    contestBloc.getContestDetail(id);
  }

  void getProfile() async {
    // LoginApiProvider user = new LoginApiProvider();
    LoginRepository loginRepository = LoginRepository();
    var profile = await loginRepository.getProfile(email);
    setState(() {
      _profile = profile;
    });
  }

  _ContestDetailScreenState(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chi tiết cuộc thi"),
          backgroundColor: AppConstant.backgroundColor,
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: contestBloc.contestDetail,
            builder: (context, AsyncSnapshot<Contest> snapshot) {
              if (snapshot.hasData) {
                return _buildContestDetail(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _buildContestDetail(Contest data) {
    var imageListUrl = data.image.split("|");

    // ImageSlideshow(
    //         width: double.infinity,
    //         height: 200,
    //         initialPage: 0,
    //         indicatorColor: Colors.blue,
    //         indicatorBackgroundColor: Colors.grey,
    //         autoPlayInterval: 5000,
    //         isLoop: true,
    //         children: [
    //           for (int i = 0; i < imageListUrl.length - 1; i++)
    //             Image(
    //               image: NetworkImage(imageListUrl[i]),
    //               fit: BoxFit.cover,
    //             ),
    //         ],
    //       ),

    return ListView(
      children: [
        Image(
          image: AssetImage("assets/images/slider_2.png"),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            data.title,
            style: TextStyle(fontWeight: AppConstant.titleBold, fontSize: 23),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                // color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ngày bắt đầu",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      data.startRegister,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Ngày kết thúc",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      data.endRegister,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Thời gian",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      data.startDate,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Thời gian",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      data.endDate,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Số người tối thiểu",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      data.minParticipants.toString() + " người",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Số người tối đa",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      data.maxParticipants.toString() + " người",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Số người hiện tại",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      data.currentParticipants.toString() + " người",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text('user id la: ' + data.id.toString()),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            "Địa điểm tổ chức",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            data.venue,
            style: TextStyle(fontSize: 18),
            maxLines: 5,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            "Mô tả",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            data.description,
            style: TextStyle(fontSize: 18),
            maxLines: 15,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 32.0.h,
            ),
            TextButton(
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: AppConstant.backgroundColor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Tham gia",
                    style: TextStyle(
                        color: AppConstant.backgroundColor, fontSize: 16),
                  )
                ],
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Xác nhận'),
                    content: Text('Bạn có muốn tham gia sự kiện này không ?'),
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
                            int userID = _profile!.id;
                            int contestID = data.id;
                            UserContest userContest = UserContest(
                                contestId: contestID, userId: userID);
                            ContestRepository contestRepository =
                                ContestRepository();
                            contestRepository.registerContest(userContest);
                            // SnackBar snackbar = SnackBar(
                            //     content: Text('Đăng ký thành công'));
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(snackbar);
                            //     Navigator.pop(context);
                            //      Navigator.pop(context);
                          },
                          child:
                              Text('Có', style: TextStyle(color: Colors.white)),
                          color: AppConstant.backgroundColor),
                    ],
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}
