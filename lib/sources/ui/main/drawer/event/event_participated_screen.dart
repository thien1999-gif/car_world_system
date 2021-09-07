import 'package:car_world_system/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
class EventParticipatedScreen extends StatefulWidget {
  const EventParticipatedScreen({ Key? key }) : super(key: key);

  @override
  _EventParticipatedScreenState createState() => _EventParticipatedScreenState();
}

class _EventParticipatedScreenState extends State<EventParticipatedScreen> {
  final List<Map> myProducts =
      List.generate(15, (index) => {"id": index, "name": "Product $index"})
          .toList();
  var rateValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: myProducts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Container(
                        height: 22.h,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    width: 14.h,
                                    height: 21.5.h,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.0)),
                                      shape: BoxShape.rectangle,
                                      image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/slider_4.png")),
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
                                      Icons.event,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Triễn lãm xe ",
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
                                    Icon(
                                      Icons.timeline,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "15h - 01/01/2000 ",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.people,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "10 người",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Tp.Hồ Chí Minh",
                                      style: TextStyle(fontSize: 15),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RaisedButton(
                                      child: Text(
                                        "Phản hồi",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text('Xác nhận'),
                                                  content: Container(
                                                    height: 25.h,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Vui lòng nhập phản hồi của bạn về sự kiện."),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        TextFormField(
                                                          //controller: ,
                                                          maxLines: 5,
                                                          decoration:
                                                              InputDecoration(
                                                            label: Text(
                                                              "Phản hồi",
                                                              style: TextStyle(
                                                                  color: AppConstant
                                                                      .backgroundColor),
                                                            ),
                                                            hintText:
                                                                "Vui lòng nhập phản hồi của bạn",
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: AppConstant
                                                                      .backgroundColor),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          // validator: (value) {
                                                          //   if (value!.isEmpty) {
                                                          //     return 'Vui lòng nhập tiêu đề';
                                                          //   }
                                                          //   return null;
                                                          // },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                        onPressed: () {},
                                                        child: Text('Hủy',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        color: AppConstant
                                                            .backgroundColor),
                                                    FlatButton(
                                                        onPressed: () {},
                                                        child: Text('Gửi',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        color: AppConstant
                                                            .backgroundColor),
                                                  ],
                                                ));
                                      },
                                      color: AppConstant.backgroundColor,
                                    ),
                                    SizedBox(
                                      width: 1.h,
                                    ),
                                    RaisedButton(
                                      child: Text(
                                        "Đánh giá",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Xác nhận'),
                                            content: Container(
                                              height: 13.h,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Vui lòng nhập đánh giá của bạn về sự kiện."),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: 0,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      setState(() {
                                                        rateValue = rating;
                                                        print(rateValue);
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                  onPressed: () {},
                                                  child: Text('Hủy',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  color: AppConstant
                                                      .backgroundColor),
                                              FlatButton(
                                                  onPressed: () {},
                                                  child: Text('Gửi',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  color: AppConstant
                                                      .backgroundColor),
                                            ],
                                          ),
                                        );
                                      },
                                      color: AppConstant.backgroundColor,
                                    ),
                                    SizedBox(width: 5,),
                                    Text("X")
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