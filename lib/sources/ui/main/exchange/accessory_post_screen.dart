import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/model/exchange_accessory.dart';
import 'package:car_world_system/sources/model/userProfile.dart';
import 'package:car_world_system/sources/repository/exchange_accessory_repository.dart';
import 'package:car_world_system/sources/repository/login_repository.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:sizer/sizer.dart';

class AccessoryPostScreen extends StatefulWidget {
  const AccessoryPostScreen({Key? key}) : super(key: key);

  @override
  _AccessoryPostScreenState createState() => _AccessoryPostScreenState();
}

class _AccessoryPostScreenState extends State<AccessoryPostScreen> {
  UserProfile? _profile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  void getProfile() async {
    // LoginApiProvider user = new LoginApiProvider();
    LoginRepository loginRepository = LoginRepository();
    var profile = await loginRepository.getProfile(email);
    setState(() {
      _profile = profile;
    });
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var addressController = TextEditingController();
  var accessoryNameController = TextEditingController();
  var maxPeopleController = TextEditingController();
  var priceController = TextEditingController();
  var amountController = TextEditingController();

  bool _isUsed = false;

//list anh
  List<Asset> images = <Asset>[];
  //list link anh
  List<String> imageUrls = <String>[];
  String _error = 'No Error Dectected';
  bool isUploading = false;

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
          actionBarTitle: "Chọn ảnh",
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
    if (_profile == null) {
      return Container();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Đăng tin link kiện"),
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
                      controller: titleController,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập tiêu đề';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    TextFormField(
                      controller: accessoryNameController,
                      decoration: InputDecoration(
                        label: Text(
                          "Tên linh kiện",
                          style: TextStyle(color: AppConstant.backgroundColor),
                        ),
                        hintText: "Vui lòng nhập tên linh kiện",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppConstant.backgroundColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập tên linh kiện';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Trạng thái sử dụng:', style: TextStyle(color:AppConstant.backgroundColor, fontSize: 16),),
                          LabeledRadio(
                            label: 'Không',
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            value: false,
                            groupValue: _isUsed,
                            onChanged: (bool newValue) {
                              setState(() {
                                _isUsed = newValue;
                              });
                            },
                          ),
                          LabeledRadio(
                            label: 'Có',
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            value: true,
                            groupValue: _isUsed,
                            onChanged: (bool newValue) {
                              setState(() {
                                _isUsed = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    // Text(_isUsed.toString()),
                    TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          "Giá",
                          style: TextStyle(color: AppConstant.backgroundColor),
                        ),
                        hintText: "Vui lòng nhập giá",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppConstant.backgroundColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập giá';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          "Số lượng linh kiện",
                          style: TextStyle(color: AppConstant.backgroundColor),
                        ),
                        hintText: "Vui lòng nhập số lượng linh kiện",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppConstant.backgroundColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập số lượng linh kiện';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    TextFormField(
                      controller: addressController,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập địa chỉ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    TextFormField(
                      controller: descriptionController,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập mô tả';
                        }
                        return null;
                      },
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
                                      content: Text(
                                          "Không có ảnh nào được chọn",
                                          style:
                                              TextStyle(color: Colors.white)),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            } else {
                              SnackBar snackbar = SnackBar(
                                  content:
                                      Text('Vui lòng đợi trong giây lát.'));
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
                            "Đăng tin",
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
                                        onPressed: () {
                                          List<ExchangeAccDetail> list = [];
                                          list.add(ExchangeAccDetail(
                                              accessoryName: "accessoryName",
                                              isUsed: true,
                                              image: "image",
                                              price: 1,
                                              amount: 1));
                                          ExchangeAccessory exchangeAccessory =
                                              ExchangeAccessory(
                                                  userId: 18,
                                                  title: "title",
                                                  description: "description",
                                                  address: "address",
                                                  exchangeAccDetails: list);
                                          ExchangeAccessoryRepository
                                              exchangeAccessoryRepository =
                                              ExchangeAccessoryRepository();
                                          exchangeAccessoryRepository
                                              .createExchangeAccessory(
                                                  exchangeAccessory);

                                          SnackBar snackbar = SnackBar(
                                              content: Text(
                                                  'Bạn đã gửi thành công'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackbar);
                                        },
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
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
