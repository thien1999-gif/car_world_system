import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/event_bloc.dart';
import 'package:car_world_system/sources/model/event.dart';
import 'package:car_world_system/sources/model/userEvent.dart';
import 'package:car_world_system/sources/model/userProfile.dart';
import 'package:car_world_system/sources/repository/event_repository.dart';
import 'package:car_world_system/sources/repository/login_repository.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EventDetailScreen extends StatefulWidget {
  final int id;
  const EventDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState(id);
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final int id;
  UserProfile? _profile;
  _EventDetailScreenState(this.id);
  @override
  void initState() {
    super.initState();
    getProfile();
    eventBloc.getEventDetail(id);
  }

  void getProfile() async {
    // LoginApiProvider user = new LoginApiProvider();
    LoginRepository loginRepository = LoginRepository();
    var profile = await loginRepository.getProfile(email);
    setState(() {
      _profile = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết sự kiện"),
        backgroundColor: AppConstant.backgroundColor,
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: eventBloc.eventDetail,
          builder: (context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.hasData) {
              return _buildEventDetail(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _buildEventDetail(Event data) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Thời gian đăng ký sự kiện"),
                Text(
                  data.startRegister.substring(0, 10) +
                      " - " +
                      data.endRegister.substring(0, 10),
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  data.startRegister.substring(12, 16) +
                      " - " +
                      data.endRegister.substring(12, 16),
                  style: TextStyle(fontSize: 15),
                ),

                Text("Thời gian diễn ra sự kiện"),
                Text(
                  data.startDate.substring(0, 10) +
                      " - " +
                      data.endDate.substring(0, 10),
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  data.startDate.substring(12, 16) +
                      " - " +
                      data.endDate.substring(12, 16),
                  style: TextStyle(fontSize: 15),
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
                            int eventID = data.id;
                            UserEvent userEvent =
                                UserEvent(eventId: eventID, userId: userID);
                            EventRepository eventRepository = EventRepository();
                            eventRepository.registerEvent(userEvent);
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
