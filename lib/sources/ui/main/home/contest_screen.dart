import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/contest_bloc.dart';
import 'package:car_world_system/sources/model/contest.dart';
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
        loadListContest()
      ],
    ));
  }

  Widget loadListContest() {
    if (sortEvent == "Mới nhất") {
      contestBloc.getListNewContest();
      return StreamBuilder(
          stream: contestBloc.listContest,
          builder: (context, AsyncSnapshot<List<Contest>> snapshot) {
            if (snapshot.hasData) {
              return _buildListContest(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    } else {
      contestBloc.getListSignficantContest();
      return StreamBuilder(
          stream: contestBloc.listContest,
          builder: (context, AsyncSnapshot<List<Contest>> snapshot) {
            if (snapshot.hasData) {
              return _buildListContest(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    }
  }

  Widget _buildListContest(List<Contest> data) {
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
                                            image: AssetImage(
                                                "assets/images/slider_3.png")),
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
                                      Text(
                                        data[index].title,
                                        style: TextStyle(
                                            fontWeight: AppConstant.titleBold,
                                            fontSize: 16),
                                      ),
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
