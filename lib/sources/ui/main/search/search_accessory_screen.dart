import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/accessory_bloc.dart';
import 'package:car_world_system/sources/model/accessory.dart';
import 'package:car_world_system/sources/ui/main/search/search_acessory_detail.dart';
import 'package:car_world_system/sources/ui/main/search/search_car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchAccessoryScreen extends StatefulWidget {
  @override
  _SearchAccessoryScreenState createState() => _SearchAccessoryScreenState();
}

class _SearchAccessoryScreenState extends State<SearchAccessoryScreen> {
  final searchValue = TextEditingController();
  bool isSelect = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 1.h,
            ),
            Container(
              width: 38.h,
              height: 8.h,
              child: TextFormField(
                controller: searchValue,
                decoration: InputDecoration(
                  label: Text(
                    "Tìm kiếm linh kiện",
                    style: TextStyle(color: AppConstant.backgroundColor),
                  ),
                  hintText: "Bạn có thể tìm kiếm theo tên, hãng,...",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppConstant.backgroundColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
                  isSelect = false;
                });
              },
            ),
          ],
        ),
        loadListAccessory()
      ],
    ));
  }

  Widget loadListAccessory() {
    if (isSelect) {
      accessoryBloc.getListAccessory();
      return StreamBuilder(
          stream: accessoryBloc.listAccessory,
          builder: (context, AsyncSnapshot<List<Accessory>> snapshot) {
            if (snapshot.hasData) {
              return _buildListAccessory(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    } else {
      accessoryBloc.getListAccessoryByName(searchValue.text);
      return StreamBuilder(
          stream: accessoryBloc.listAccessory,
          builder: (context, AsyncSnapshot<List<Accessory>> snapshot) {
            if (snapshot.hasData) {
              return _buildListAccessory(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    }
  }

  Widget _buildListAccessory(List<Accessory> data) {
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
              child: Image(image: AssetImage("assets/images/not found.png"),
              fit: BoxFit.cover,),
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
                            builder: (context) => SearchAccessoryDetailScreen(
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
                                        Icons.settings_input_component,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          child: Text(
                                            data[index].name.length > 63
                                                ? data[index]
                                                        .name
                                                        .substring(0, 60) +
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
                                        Icons.precision_manufacturing,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '...',
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
                                        data[index].price.toString() + " đồng",
                                        style: TextStyle(fontSize: 15, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
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
