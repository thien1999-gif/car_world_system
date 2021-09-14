import 'package:car_world_system/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProposalScreen extends StatefulWidget {
  const ProposalScreen({Key? key}) : super(key: key);

  @override
  _ProposalScreenState createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // List<Asset> images = <Asset>[];
  // Future<void> pickImages() async {
  //   List<Asset> resultList = <Asset>[];

  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 9,
  //       enableCamera: true,
  //       selectedAssets: images,
  //       materialOptions: MaterialOptions(
  //         actionBarTitle: "Chọn ảnh",
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     print(e);
  //   }

  //   setState(() {
  //     images = resultList;
  //   });
  // }

  //list anh
  List<Asset> images = <Asset>[];
  //list link anh
  List<String> imageUrls = <String>[];
  String _error = 'No Error Dectected';
  bool isUploading = false;
  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        print(asset.getByteData(quality: 100));
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<void> uploadImages() async {
    for (var imageFile in images) {
      await postImage(imageFile).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
        if (imageUrls.length == images.length) {
          String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
          Firestore.instance
              .collection('images')
              .document(documnetID)
              .setData({'urls': imageUrls}).then((_) {
            setState(() {
              images = [];
              imageUrls = [];
            });
          });
        }
      }).catchError((err) {
        print(err);
      });
    }
    SnackBar snackbar = SnackBar(content: Text('Upload ảnh thành công'));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  Future<dynamic> postImage(Asset imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask =
        reference.putData((await imageFile.getByteData()).buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
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
                        onPressed: loadAssets,
                        color: AppConstant.backgroundColor,
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      RaisedButton(
                        child: Text(
                          "Upload ảnh",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (images.length == 0) {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    backgroundColor:
                                        AppConstant.backgroundColor,
                                    content: Text("Không có ảnh nào được chọn",
                                        style: TextStyle(color: Colors.white)),
                                    actions: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 80,
                                          height: 30,
                                          child: Center(
                                              child: Text(
                                            "Đóng",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          } else {
                            SnackBar snackbar = SnackBar(
                                content: Text('Vui lòng đợi trong giây lát.'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                            uploadImages();
                            print("link anh: $imageUrls");
                          }
                        },
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
                                content:
                                    Text('Bạn có muốn gửi ý tưởng không ?'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {},
                                      child: Text('Không',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      color: AppConstant.backgroundColor),
                                  FlatButton(
                                      onPressed: () {},
                                      child: Text('Có',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      color: AppConstant.backgroundColor),
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
