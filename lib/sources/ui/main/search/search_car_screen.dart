import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/car_bloc.dart';
import 'package:car_world_system/sources/model/car.dart';
import 'package:car_world_system/sources/ui/main/search/search_car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchCarScreen extends StatefulWidget {
  @override
  _SearchCarScreenState createState() => _SearchCarScreenState();
}

class _SearchCarScreenState extends State<SearchCarScreen> {
  final searchValue = TextEditingController();
  int isSelect = 1;
  @override
  void initState() {
    super.initState();
    getProvince();
  }

  // @override
  // void dispose() {
  //    getProvince();
  //   super.dispose();
   
  // }

  String _baseUrl = "https://carworld.cosplane.asia/api/brand/GetAllBrands";
  String? _valProvince;
  List<dynamic> _dataProvince = [];
  void getProvince() async {
    final respose = await http.get(_baseUrl);
    var listData = jsonDecode(respose.body);
    setState(() {
      _dataProvince = listData;
    });
    print("data : $listData");
  }

  final formatCurrency = new NumberFormat.currency(locale: "vi_VN", symbol: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 2.h,
                ),
                Text("Hãng",
                    style: TextStyle(
                        color: AppConstant.backgroundColor, fontSize: 16)),
                SizedBox(
                  width: 1.h,
                ),
                Container(
                    width: 32.h,
                    height: 7.h,
                    child: DropdownButton(
                      hint: Text("Chọn hãng sản xuất"),
                      value: _valProvince,
                      isExpanded: true,
                      items: _dataProvince.map((item) {
                        return DropdownMenuItem(
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(item['Image']),
                                width: 25,
                                height: 25,
                              ),
                              SizedBox(
                                width: 1.h,
                              ),
                              Text(
                                item['Name'],
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          value: item['Name'],
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valProvince = value as String?;
                          isSelect = 3;
                        });
                      },
                    )),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 1.h,
                ),
                SizedBox(
                  width: 1.h,
                ),
                Container(
                  width: 38.h,
                  height: 7.h,
                  child: TextFormField(
                    controller: searchValue,

                    decoration: InputDecoration(
                      label: Text(
                        "Tìm kiếm xe hơi",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Bạn có thể tìm kiếm theo tên, hãng,...",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppConstant.backgroundColor),
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
                  onPressed: () {
                    setState(() {
                      isSelect = 2;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        loadListCar()
      ],
    ));
  }

  Widget loadListCar() {
    if (isSelect == 1) {
      carBloc.getListCar();
      return StreamBuilder(
          stream: carBloc.listCar,
          builder: (context, AsyncSnapshot<List<Car>> snapshot) {
            if (snapshot.hasData) {
              return _buildListCar(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    } else if (isSelect == 2) {
      carBloc.getListCarByName(searchValue.text);
      return StreamBuilder(
          stream: carBloc.listCar,
          builder: (context, AsyncSnapshot<List<Car>> snapshot) {
            if (snapshot.hasData) {
              return _buildListCar(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    } else {
      carBloc.getListCarByBrandName(_valProvince!);
      return StreamBuilder(
          stream: carBloc.listCar,
          builder: (context, AsyncSnapshot<List<Car>> snapshot) {
            if (snapshot.hasData) {
              return _buildListCar(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    }
  }

  Widget _buildListCar(List<Car> data) {
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
                            builder: (context) => SearchCarDetailScreen(
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
                                      Icon(
                                        Icons.directions_car,
                                        size: 15,
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          child: Text(
                                            data[index].name.length > 60
                                                ? data[index]
                                                        .name
                                                        .substring(0, 57) +
                                                    "..."
                                                : data[index].name,
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
                                      Icon(
                                        Icons.money,
                                        size: 15,
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${formatCurrency.format(data[index].price)} VNĐ',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
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
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data[index].seats.toString() + " chỗ",
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
