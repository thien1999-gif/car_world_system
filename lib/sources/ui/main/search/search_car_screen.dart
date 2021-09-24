import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/car_bloc.dart';
import 'package:car_world_system/sources/model/car.dart';
import 'package:car_world_system/sources/ui/main/search/search_car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchCarScreen extends StatefulWidget {
  @override
  _SearchCarScreenState createState() => _SearchCarScreenState();
}

class _SearchCarScreenState extends State<SearchCarScreen> {
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
              onPressed: () {
                setState(() {
                  isSelect = false;
                });
              },
            ),
          ],
        ),
        loadListCar()
      ],
    ));
  }

    Widget loadListCar() {
    if (isSelect) {
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
    } else {
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
    }
  }

   Widget _buildListCar(List<Car> data) {
     if(data.length == 0){
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
     }
     else{
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
                              builder: (context) => SearchCarDetailScreen(id: data[index].id,),
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
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          data[index].name,
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
                                          ".",
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
                                          data[index].price.toString() +" đồng",
                                          style: TextStyle(fontSize: 15, color: Colors.red),
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
                                         data[index].seats.toString() +" chỗ",
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
        );
     }
   }
}
