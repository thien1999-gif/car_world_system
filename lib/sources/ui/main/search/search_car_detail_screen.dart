import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/bloc/car_bloc.dart';
import 'package:car_world_system/sources/model/car.dart';
import 'package:car_world_system/sources/ui/main/search/brand_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class SearchCarDetailScreen extends StatefulWidget {
  final int id;
  const SearchCarDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _SearchCarDetailScreenState createState() => _SearchCarDetailScreenState(id);
}

class _SearchCarDetailScreenState extends State<SearchCarDetailScreen> {
  final int id;
  final formatCurrency = new NumberFormat.currency(locale: "vi_VN", symbol: "");
  _SearchCarDetailScreenState(this.id);
  @override
  void initState() {
    super.initState();
    carBloc.getAccessoryDetail(id);
  }

  final ScrollController scrollController_1 = ScrollController();
  final ScrollController scrollController_2 = ScrollController();
  final ScrollController scrollController_3 = ScrollController();
  final ScrollController scrollController_4 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết xe"),
        backgroundColor: AppConstant.backgroundColor,
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: carBloc.carDetail,
          builder: (context, AsyncSnapshot<Car> snapshot) {
            if (snapshot.hasData) {
              return _buildCarDetail(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _buildCarDetail(Car data) {
    var imageListUrl = data.image.split("|");
    return ListView(
      children: [
        ImageSlideshow(
          width: double.infinity,
          height: 200,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          autoPlayInterval: 5000,
          isLoop: true,
          children: [
            for (int i = 0; i < imageListUrl.length - 1; i++)
              Image(
                image: NetworkImage(imageListUrl[i]),
                fit: BoxFit.cover,
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            data.name,
            style: TextStyle(fontWeight: AppConstant.titleBold, fontSize: 23),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            "Giá",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text('${formatCurrency.format(data.price)} VNĐ',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            "Hãng sản xuất",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
        BrandScreen(id: data.brandId),
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
              height: 22.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(1.0))),
              child: Scrollbar(
                isAlwaysShown: true,
                controller: scrollController_1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController_1,
                  children: [
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
                                  "Kiểu dáng",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.bodyType,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Hộp số",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.gearBox,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Xuất xứ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.origin,
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
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.seats.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Năm sản xuất",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.yearOfManufactor.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                               
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),

        //  thông số cơ bản
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
            height: 30.h,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(1.0))),
            child: Scrollbar(
              isAlwaysShown: true,
              controller: scrollController_2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: scrollController_2,
                children: [
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
                                "Dài*Rộng*Cao",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                data.length.toString() +
                                    "*" +
                                    data.width.toString() +
                                    "*" +
                                    data.height.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Công suất cực đại",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                data.maxPower.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Dung tích (cc)",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                data.displacement.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Động cơ",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                data.engineType,
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                data.maxTorque.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Khoảng cách gầm xe",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                data.groundClearance.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Tiêu hao nhiên liệu",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                data.fuelConsumption.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Bán kính quay",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Text(
                                data.turningRadius.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //thong số kỉ thuật
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            "Thông số kỉ thuật",
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2),
          child: Container(
              height: 23.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(1.0))),
              child: Scrollbar(
                isAlwaysShown: true,
                controller: scrollController_3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController_3,
                  children: [
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
                                  "Dung tích bình xăng",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.fuelCapacity.toString() + " l",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Kích thước mâm xe",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.wheelSize,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Kích thước bánh xe",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.tyreSize,
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
                                  "Trọng lượng khô",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.kerbWeight.toString() + " kg",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Hệ thống treo trước",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.frontSuspension,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Hệ thống treo sau",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.rearSuspension,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),

        //nội ngoại thất
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Text(
            "Nội và ngoại thất",
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2),
          child: Container(
              height: 15.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(1.0))),
              child: Scrollbar(
                isAlwaysShown: true,
                controller: scrollController_4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController_4,
                  children: [
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
                                  "Chất liệu nội thất",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.interiorMaterial,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Cụm đèn trước",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.headLights,
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
                                  "Cụm đèn sau",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.tailLights,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  "Đèn sương mù",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Text(
                                  data.fogLamps,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
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
            data.despcription,
            style: TextStyle(fontSize: 18),
            maxLines: 15,
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
            "Khu công nghệ cao Hòa Lạc – Km29, ĐCT08, Thạch Hoà, Thạch Thất, Hà Nội 10000, Vietnam",
            style: TextStyle(fontSize: 18),
            maxLines: 5,
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
    );
  }
}
