import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/ui/main/search/search_car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchCarScreen extends StatefulWidget {
  @override
  _SearchCarScreenState createState() => _SearchCarScreenState();
}

class _SearchCarScreenState extends State<SearchCarScreen> {
  final List<Map> myProducts =
      List.generate(15, (index) => {"id": index, "name": "Product $index"})
          .toList();

  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(height: 2.h,),
        Row(
          children: [
            SizedBox(
              width: 1.h,
            ),
            Container(
              width: 38.h,
              height: 8.h,
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
              ),
            ),
            SizedBox(
              width: 1.h,
            ),
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
                              builder: (context) => SearchCarDetailScreen(),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          "BMW Z4",
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
    ));
  }
}
