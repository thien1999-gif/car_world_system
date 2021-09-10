import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/main/exchange/exchange_car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExchangeCarScreen extends StatefulWidget {
  const ExchangeCarScreen({Key? key}) : super(key: key);

  @override
  _ExchangeCarScreenState createState() => _ExchangeCarScreenState();
}

class _ExchangeCarScreenState extends State<ExchangeCarScreen> {
  String distance = '5';
  final List<Map> myProducts =
      List.generate(15, (index) => {"id": index, "name": "Product $index"})
          .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 1.h,
              ),
              Container(
                width: 12.h,
                height: 7.1.h,
                child: DropdownButtonFormField<String>(
                  value: distance,
                  isExpanded: true,
                  decoration: InputDecoration(
                      labelText: 'Khoảng cách (km)',
                      fillColor: AppConstant.backgroundColor),
                  onChanged: (String? newValue) {
                    setState(() {
                      distance = newValue!;
                      //Text(distance)
                    });
                  },
                  items: <String>['5', '10', '15']
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
              ),Container(
                width: 28.h,
                height: 7.h,
                child: TextFormField(
                //controller: ,

                decoration: InputDecoration(
                  label: Text(
                    "Tìm kiếm xe hơi",
                    style: TextStyle(color: AppConstant.backgroundColor),
                  ),
                  hintText: "Bạn có thể tìm kiếm theo tên, hãng,...",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppConstant.backgroundColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Vui lòng nhập tiêu đề';
                //   }
                //   return null;
                // },
              )),
              IconButton(
                icon: Icon(Icons.search),
                color: AppConstant.backgroundColor,
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
          Container(
            height: 62.1.h,
            width: 500.h,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: myProducts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExchangeCarDetailScreen(),
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
                                                    "assets/images/slider_2.png")),
                                          )),
                                    ],
                                  ),
                                  Container(
                                    width: 1.0.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.directions_car,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Bán xe",
                                            style: TextStyle(
                                                fontWeight:
                                                    AppConstant.titleBold,
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
                                            Icons.precision_manufacturing,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "BMW",
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
                                            "3000000000 đồng",
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
                                            Icons.chair,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "4 chỗ",
                                            style: TextStyle(fontSize: 15),
                                          ),
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
          )
        ],
      ),
    );
  }
}
