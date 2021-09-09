import 'package:car_world_system/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class ExchangeCarDetailScreen extends StatefulWidget {
  const ExchangeCarDetailScreen({ Key? key }) : super(key: key);

  @override
  _ExchangeCarDetailScreenState createState() => _ExchangeCarDetailScreenState();
}

class _ExchangeCarDetailScreenState extends State<ExchangeCarDetailScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết xe"),
        backgroundColor: AppConstant.backgroundColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image(
            image: AssetImage("assets/images/slider_3.png"),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Bán xe",
              style: TextStyle(fontWeight: AppConstant.titleBold, fontSize: 23),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Giá",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "3000000000 đồng",
              style: TextStyle(fontSize: 18),
            ),
          ),

// thông số cơ bản
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Thông số cơ bản",
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(1.0))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      // color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dài*Rộng*Cao",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "4239x1961x1291",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Công suất cực đại",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "335",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Dung tích (cc)",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "1997",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Động cơ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "V4",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Động cơ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "V4",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4.h,
                    ),
                    Container(
                      // color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Momen xoắn cực đại",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "320",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Khoảng cách gầm xe",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "100",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Tiêu hao nhiên liệu",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "20km/l",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Bán kính quay",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "10",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Bán kính quay",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "10",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Địa điểm showroom",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Ấp 1 xã An Thạnh huyện Bến Lức tỉnh Long An",
              style: TextStyle(fontSize: 18),
              maxLines: 5,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Mô tả",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Thế hệ mới của dòng xe BMW Z4 2021 với những thiết kế hiện đại bắt kịp được xu hướng thịnh hành của các mẫu xe thể thao hiện nay. Bên cạnh đó, những trang bị tiện nghi của dòng xe này là thật sự nổi bật hơn rất nhiều so với các đối thủ trong cùng phân khúc. Bên cạnh đó là diện mạo thể thao và thật sự năng động cũng chính là lợi thế của dòng xe này.",
              style: TextStyle(fontSize: 18),
              maxLines: 15,
            ),
          ),

          Row(
            children: [
              SizedBox(
                width: 25.0.h,
              ),
              
              TextButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: AppConstant.backgroundColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Liên hệ trao đổi",
                      style: TextStyle(
                          color: AppConstant.backgroundColor, fontSize: 16),
                    )
                  ],
                ),
                onPressed: () {
                    showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Xác nhận'),
                      content:
                          Text('Bạn có chắc là muốn liên hệ trao đổi không?'),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {},
                            child: Text('Không',
                                style: TextStyle(color: Colors.white)),
                            color: AppConstant.backgroundColor),
                        FlatButton(
                            onPressed: () {},
                            child: Text('Có',
                                style: TextStyle(color: Colors.white)),
                            color: AppConstant.backgroundColor),
                      ],
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}