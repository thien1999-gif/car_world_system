import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/exchange_bloc.dart';
import 'package:car_world_system/sources/model/exchange_accessory.dart';
import 'package:car_world_system/sources/ui/main/exchange/exchange_accessory_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ExchangeAccessoryScreen extends StatefulWidget {
  const ExchangeAccessoryScreen({Key? key}) : super(key: key);

  @override
  _ExchangeAccessoryScreenState createState() =>
      _ExchangeAccessoryScreenState();
}

class _ExchangeAccessoryScreenState extends State<ExchangeAccessoryScreen> {
  // String distance = '5';
final formatCurrency = new NumberFormat.currency(locale: "vi_VN", symbol: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 1.h,
          ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 1.h,
          //     ),
          //     Container(
          //       width: 12.h,
          //       height: 7.1.h,
          //       child: DropdownButtonFormField<String>(
          //         value: distance,
          //         isExpanded: true,
          //         decoration: InputDecoration(
          //             labelText: 'Khoảng cách (km)',
          //             fillColor: AppConstant.backgroundColor),
          //         onChanged: (String? newValue) {
          //           setState(() {
          //             distance = newValue!;
          //             //Text(distance)
          //           });
          //         },
          //         items: <String>['5', '10', '15']
          //             .map<DropdownMenuItem<String>>((String value) {
          //           return DropdownMenuItem<String>(
          //             value: value,
          //             child: Text(value),
          //           );
          //         }).toList(),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 1.h,
          //     ),
          //     Container(
          //         width: 28.h,
          //         height: 7.h,
          //         child: TextFormField(
          //           //controller: ,

          //           decoration: InputDecoration(
          //             label: Text(
          //               "Tìm kiếm linh kiện",
          //               style: TextStyle(color: AppConstant.backgroundColor),
          //             ),
          //             hintText: "Bạn có thể tìm kiếm theo tên, hãng,...",
          //             focusedBorder: OutlineInputBorder(
          //               borderSide:
          //                   BorderSide(color: AppConstant.backgroundColor),
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //           ),
          //           // validator: (value) {
          //           //   if (value!.isEmpty) {
          //           //     return 'Vui lòng nhập tiêu đề';
          //           //   }
          //           //   return null;
          //           // },
          //         )),
          //     IconButton(
          //       icon: Icon(Icons.search),
          //       color: AppConstant.backgroundColor,
          //       iconSize: 30,
          //       onPressed: () {},
          //     ),
          //   ],
          // ),
          _loadListExchangeAccessoryOfUser(),
        ],
      ),
    );
  }
    Widget _loadListExchangeAccessoryOfUser() {
    
      exchangeBloc.getListExchangeAccessoryByLocation();
      return StreamBuilder(
          stream: exchangeBloc.listExchangeAccessoryOfUser,
          builder: (context, AsyncSnapshot<List<ExchangeAccessory>> snapshot) {
            if (snapshot.hasData) {
              return _buildList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          });
    
  }

  Widget _buildList(List<ExchangeAccessory> data) {
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
                    onTap: 
                     () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExchangeAccessoryDetailScreen(
                              id: data[index].id,
                            ),
                          ));
                    },
                    child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Container(
                          height: 19.h,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 14.h,
                                      height: 18.5.h,
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        shape: BoxShape.rectangle,
                                        image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(data[index]
                                                .exchangeAccessorryDetails[0]
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
                                        Icons.event,
                                        size: 15,
                                        color: Colors.lightGreen,
                                      ),
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
                                                fontWeight: AppConstant.titleBold,
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
                                        Icons.timer,
                                        size: 15,
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data[index]
                                                .createdDate
                                                .substring(11, 16) +
                                            "/" +
                                            data[index]
                                                .createdDate
                                                .substring(0, 10),
                                        style: TextStyle(fontSize: 15),
                                        maxLines: 2,
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
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${formatCurrency.format(data[index].total)} VNĐ',
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
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data[index].address.length > 30
                                            ? data[index].title.substring(0, 28) +
                                                "..."
                                            : data[index].address,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: (data[index].status == 2)
                                            ? Row(
                                                children: [
                                                  Icon(
                                                    Icons.cancel,
                                                    size: 15,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Đã hủy",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red),
                                                  ),
                                                  SizedBox(
                                                    width: 8.5.h,
                                                  ),
                                                ],
                                              )
                                            : SizedBox(
                                                width: 17.h,
                                              ),
                                      ),
                                      Row(children: <Widget>[
                                        Text(
                                          "Xem chi tiết",
                                          style: TextStyle(
                                              color: AppConstant.backgroundColor,
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
