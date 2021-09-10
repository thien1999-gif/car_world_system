import 'package:car_world_system/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết sự kiện"),
        backgroundColor: AppConstant.backgroundColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image(
            image: AssetImage("assets/images/slider_2.png"),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Triễn lãm xe hơi ",
              style: TextStyle(fontWeight: AppConstant.titleBold, fontSize: 23),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ngày bắt đầu",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Text(
                        "01/01/2000",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Ngày kết thúc",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Text(
                        "01/02/2000",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Thời gian",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Text(
                        "15h - 19h",
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
                        "Số người tối thiểu",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Text(
                        "5 người",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Số người tối đa",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Text(
                        "50 người",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Số người hiện tại",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Text(
                        "20 người",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              "Địa điểm tổ chức",
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
              "Nếu như đã hiểu được khái niệm tổ chức sự kiện là gì? Chắc chắn quý khách đã nhận thấy được tầm quan trọng của hoạt động này đối với hoạt động kinh doanh. Tuy nhiên quy trình tổ chức sự kiện như thế nào thì không nhiều doanh nghiệp nắm rõ. Hãy cùng Cyber Show đi tìm hiểu quy trình chuẩn và những yếu tố tạo nên sự thành công của sự kiện qua nội dung bài viết này.",
              style: TextStyle(fontSize: 18),
              maxLines: 15,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 32.0.h,
              ),
              TextButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: AppConstant.backgroundColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Tham gia",
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
                      content: Text('Bạn có muốn tham gia sự kiện này không ?'),
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
