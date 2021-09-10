import 'package:car_world_system/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';

class ProposalScreen extends StatefulWidget {
  const ProposalScreen({Key? key}) : super(key: key);

  @override
  _ProposalScreenState createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<Asset> images = <Asset>[];
  Future<void> pickImages() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 9,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "Chọn ảnh",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ý tưởng"),
        centerTitle: true,
        backgroundColor: AppConstant.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    //controller: ,
                    decoration: InputDecoration(
                      label: Text(
                        "Tiêu đề",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Vui lòng nhập tiêu đề",
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  TextFormField(
                    //controller: ,
                    decoration: InputDecoration(
                      label: Text(
                        "Loại",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Vui lòng nhập loại",
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  TextFormField(
                    //controller: ,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "Số lượng người tối thiểu",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Vui lòng nhập số lượng người tối thiểu",
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  TextFormField(
                    //controller: ,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "Số lượng người tối đa",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Vui lòng nhập số lượng người tối đa",
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  TextFormField(
                    //controller: ,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      label: Text(
                        "Ngày",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Vui lòng nhập ngày",
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  TextFormField(
                    //controller: ,

                    decoration: InputDecoration(
                      label: Text(
                        "Thời gian",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Vui lòng nhập thời gian",
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  TextFormField(
                    //controller: ,
                    decoration: InputDecoration(
                      label: Text(
                        "Địa chỉ",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Vui lòng nhập địa chỉ",
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  TextFormField(
                    //controller: ,
                    maxLines: 5,
                    decoration: InputDecoration(
                      label: Text(
                        "Mô tả",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      hintText: "Vui lòng nhập mô tả của bạn",
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
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ảnh: ",
                        style: TextStyle(color: AppConstant.backgroundColor),
                      ),
                      RaisedButton(
                        child: Text(
                          "Chọn ảnh",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: pickImages,
                        color: AppConstant.backgroundColor,
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      RaisedButton(
                        child: Text(
                          "Gửi ý tưởng",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Xác nhận'),
                                content: Text(
                                    'Bạn có muốn gửi ý tưởng không ?'),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text('Không',style: TextStyle(color: Colors.white)),
                                    color: AppConstant.backgroundColor
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text('Có', style: TextStyle(color: Colors.white)),
                                    color: AppConstant.backgroundColor
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        color: AppConstant.backgroundColor,
                      ),
                    ],
                  ),
                  Container(
                      width: 100.h,
                      height: 50.h,
                      child: Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          children: List.generate(images.length, (index) {
                            Asset asset = images[index];
                            return AssetThumb(
                              asset: asset,
                              width: 300,
                              height: 300,
                            );
                          }),
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
