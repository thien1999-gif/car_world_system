import 'package:car_world_system/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContestRegisteredScreen extends StatefulWidget {
  const ContestRegisteredScreen({Key? key}) : super(key: key);

  @override
  _ContestRegisteredScreenState createState() =>
      _ContestRegisteredScreenState();
}

class _ContestRegisteredScreenState extends State<ContestRegisteredScreen> {
  final List<Map> myProducts =
      List.generate(15, (index) => {"id": index, "name": "Product $index"})
          .toList();

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
                                    Icon(
                                      Icons.sports_kabaddi,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Đua xe địa hình ",
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
                                      Icons.money,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "100.000 đồng",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                RaisedButton(
                                  child: Text(
                                    "Hủy",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Xác nhận'),
                                        content: Text(
                                            'Bạn có chắc là muốn hủy tham gia không ?'),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () {},
                                              child: Text('Không',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              color:
                                                  AppConstant.backgroundColor),
                                          FlatButton(
                                              onPressed: () {},
                                              child: Text('Có',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              color:
                                                  AppConstant.backgroundColor),
                                        ],
                                      ),
                                    );
                                  },
                                  color: AppConstant.backgroundColor,
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
