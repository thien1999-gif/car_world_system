import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/contest_bloc.dart';
import 'package:car_world_system/sources/model/contest.dart';
import 'package:car_world_system/sources/model/userContest.dart';
import 'package:car_world_system/sources/model/userProfile.dart';
import 'package:car_world_system/sources/repository/contest_repository.dart';
import 'package:car_world_system/sources/repository/login_repository.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';
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
  bool _enable = true;
  var now = DateTime.now(); // lay ngày hiện hành
  final formatCurrency = new NumberFormat.currency(locale: "vi_VN", symbol: "");
  var startDateConvert;
  DateTime convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    print(todayDate);
    return todayDate;
  }

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
    startDateConvert = convertDateFromString(data.startRegister);

    int checkDate = now.compareTo(startDateConvert);
    print("////");
    print(now.toString());
    print(startDateConvert.toString());
    print(checkDate.toString());
    if (checkDate < 0) {
      _enable = false;
    } else {
      _enable = true;
    }
    print("so sanh ngay de check");
    print(_enable);

    return ListView(
      children: [
        // ImageSlideshow(
        //     width: double.infinity,
        //     height: 200,
        //     initialPage: 0,
        //     indicatorColor: Colors.blue,
        //     indicatorBackgroundColor: Colors.grey,
        //     autoPlayInterval: 5000,
        //     isLoop: true,
        //     children: [
        //       for (int i = 0; i < imageListUrl.length - 1; i++)
        //         Image(
        //           image: NetworkImage(imageListUrl[i]),
        //           fit: BoxFit.cover,
        //         ),
        //     ],
        //   ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            data.title,
            style: TextStyle(fontWeight: AppConstant.titleBold, fontSize: 23),
          ),
        ),
       Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Row(children: [
            Text(
                  "Phí tham gia: ",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 18),
                ),
            Text('${formatCurrency.format(data.fee)} VNĐ',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold))
          ],),
        ),
 Container(
            padding: EdgeInsets.only(left: 1.h),
            child: (_enable)
                ? Text("")
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Lưu ý *** ",
                        style: TextStyle(color: Colors.red, fontSize: 17),
                      ),
                      Text(
                        "Vì chưa đến thời gian đăng kí tham gia nên bạn có thể đăng kí sau. ",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ],
                  )),
                Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Thời gian đăng ký sự kiện",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 18),
                ),
                
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.lightGreen,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Text(
                      'Từ ' +
                          data.startRegister.substring(11, 16) +
                          "/" +
                          data.startRegister.substring(0, 10) +
                          " đến " +
                          data.endRegister.substring(11, 16) +
                          '/' +
                          data.endRegister.substring(0, 10),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text("Thời gian diễn ra sự kiện",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18)),
          
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.lightGreen,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Text(
                      'Từ ' +
                          data.startDate.substring(11, 16) +
                          "/" +
                          data.startDate.substring(0, 10) +
                          " đến " +
                          data.endDate.substring(11, 16) +
                          '/' +
                          data.endDate.substring(0, 10),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Số lượng người có thể tham gia",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 18),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      color: Colors.lightGreen,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Text(
                      'Từ ' +
                          data.minParticipants.toString() +
                          ' người đến ' +
                          data.maxParticipants.toString() +
                          ' người',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Số lượng người tham gia hiện tai",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 18),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      color: Colors.lightGreen,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Text(
                      data.currentParticipants.toString() + ' người',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )),
            
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
              onPressed: _enable ? () {
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
                            SnackBar snackbar = SnackBar(
                                content: Text('Đăng ký thành công'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                                Navigator.pop(context);
                                 Navigator.pop(context);
                          },
                          child:
                              Text('Có', style: TextStyle(color: Colors.white)),
                          color: AppConstant.backgroundColor),
                    ],
                  ),
                );
              } : null,
            )
          ],
        )
      ],
    );
  }
}
