import 'package:car_world_system/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchAccessoryDetailScreen extends StatefulWidget {
  const SearchAccessoryDetailScreen({Key? key}) : super(key: key);

  @override
  _SearchAccessoryDetailScreenState createState() => _SearchAccessoryDetailScreenState();
}

class _SearchAccessoryDetailScreenState extends State<SearchAccessoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết linh kiện"),
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
              "Vô lăng",
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

          //thông số chính
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Thông số chính",
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
                            "Kiểu dáng",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Mui trần",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Hộp số",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Auto",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Hãng",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "BMW",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Container(
                      // color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chỗ ngồi",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "6",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Năm sản xuất",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "2010",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Xuất xứ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Text(
                            "Nhập khẩu",
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
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Lưu ý ***",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Nếu quý khách có nhu cầu về xe, quý khách vui lòng đến trực tiếp showroom tại địa chỉ trên. ",
              style: TextStyle(fontSize: 18),
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
