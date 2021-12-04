import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/contest_bloc.dart';
import 'package:car_world_system/sources/model/contest.dart';
import 'package:car_world_system/sources/model/event_contest.dart';
import 'package:car_world_system/sources/ui/main/home/contest_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({Key? key}) : super(key: key);

  @override
  _ContestScreenState createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {
  String sortEvent = 'Mới nhất';
  final formatCurrency = new NumberFormat.currency(locale: "vi_VN", symbol: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
        Row(
          children: [
            SizedBox(
              width: 1.h,
            ),
            Container(
              width: 13.h,
              height: 8.1.h,
              child: DropdownButtonFormField<String>(
                value: sortEvent,
                isExpanded: true,
                decoration: InputDecoration(
                    labelText: 'Sắp xếp theo',
                    fillColor: AppConstant.backgroundColor),
                onChanged: (String? newValue) {
                  setState(() {
                    sortEvent = newValue!;
                  });
                },
                items: <String>['Mới nhất', 'Nổi bật']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: 1.h,
            ),
          ],
        ),
         SingleChildScrollView(
            child: Container(
              width: 0,
              height: 45.h,
              child:loadListContest(),
            ),
          )
        
      ],
    ));
  }

  Widget loadListContest() {
     DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String now = dateFormat.format(DateTime.now());
    if (sortEvent == "Mới nhất") {
      contestBloc.getListNewContest(now);
      return StreamBuilder(
          stream: contestBloc.listContest,
          builder: (context, AsyncSnapshot<List<EventContest>> snapshot) {
            if (snapshot.hasData) {
              return _buildListContest(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    } else {
      contestBloc.getListSignficantContest(now);
      return StreamBuilder(
          stream: contestBloc.listContest,
          builder: (context, AsyncSnapshot<List<EventContest>> snapshot) {
            if (snapshot.hasData) {
              return _buildListContest(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    }
  }

  Widget _buildListContest(List<EventContest> data) {
    if (data.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             Container(
              height: 35.h,
              width: 35.h,
              child: Image(
                image: AssetImage("assets/images/not found 2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Rất tiếc, chưa có dữ liệu hiển thị",
              style: TextStyle(
                  
                  fontStyle: FontStyle.italic,
                  fontSize: 18),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 62.1.h,
        width: 500.h,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContestDetailScreen(
                              id: data[index].id,
                            ),
                          ));
                    },
                    child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Container(
                          height: 15.h,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 14.h,
                                      height: 14.6.h,
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        shape: BoxShape.rectangle,
                                        image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(data[index]
                                                .image
                                                .split("|")
                                                .elementAt(0))),
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
                                      Icon(Icons.sports_kabaddi,
                                          size: 15, color: Colors.lightGreen),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          child: Text(
                                            data[index].title.length > 30
                                                ? data[index]
                                                        .title
                                                        .substring(0, 28) +
                                                    "..."
                                                : data[index].title,
                                            style: TextStyle(
                                                fontWeight:
                                                    AppConstant.titleBold,
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
                                      Icon(Icons.timeline,
                                          size: 15, color: Colors.lightGreen),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data[index]
                                                .startRegister
                                                .substring(0, 10) +
                                            " - " +
                                            data[index]
                                                .endRegister
                                                .substring(0, 10),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Icon(Icons.people,
                                  //         size: 15, color: Colors.lightGreen),
                                  //     SizedBox(
                                  //       width: 5,
                                  //     ),
                                  //     Text(
                                  //       data[index]
                                  //               .currentParticipants
                                  //               .toString() +
                                  //           " người",
                                  //       style: TextStyle(fontSize: 15),
                                  //     ),
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.money,
                                          size: 15, color: Colors.lightGreen),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${formatCurrency.format(data[index].fee)} VNĐ',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 17.h,
                                      ),
                                      Row(children: <Widget>[
                                        Text(
                                          "Xem chi tiết",
                                          style: TextStyle(
                                              color:
                                                  AppConstant.backgroundColor,
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
        ),
      );
    }
  }
}
