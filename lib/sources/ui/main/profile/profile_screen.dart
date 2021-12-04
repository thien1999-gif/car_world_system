import 'package:car_world_system/constant/app_constant.dart';
import 'package:car_world_system/sources/model/userProfile.dart';
import 'package:car_world_system/sources/repository/google_sign_in.dart';
import 'package:car_world_system/sources/repository/login_repository.dart';
import 'package:car_world_system/sources/ui/login/login_screen.dart';
import 'package:car_world_system/sources/ui/main/drawer/drawer.dart';
import 'package:car_world_system/sources/ui/main/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  @override
  Widget build(BuildContext context) {
    if (_profile == null) {
      return Container();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Thông tin cá nhân"),
          backgroundColor: AppConstant.backgroundColor,
          centerTitle: true,
        ),
        drawer: DrawerScreen(),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            //for circle avtar image
            _getHeader(),
            SizedBox(
              height: 10,
            ),
            _profileName(_profile!.fullName.trim()),
            SizedBox(
              height: 6,
            ),
            _detailsCard(),
            SizedBox(
              height: 10,
            ),
            _heading("Tiện ích thêm"),
            SizedBox(
              height: 6,
            ),
            _settingsCard(),
            //Spacer(),
            //logoutButton()
          ],
        )),
      );
    }
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, 10)),
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(_profile!.image))
                // color: Colors.orange[100],
                ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  var phone = "Chưa có số điện thoại";
  String? address = "Chưa có địa chỉ";
  String exchangePost = "Chưa có bài đăng";

  void getPhone() {
    if (_profile!.phone != null) {
      phone = _profile!.phone;
    }
  }

  void getAddress() {
    if (_profile!.address != null) {
      address = _profile!.address;
    }
  }

  void getExchangePost() {
    if (_profile!.exchangePost != null) {
      if (_profile!.exchangePost != 0) {
        exchangePost = _profile!.exchangePost.toString() + " bài đăng";
      }
    }
  }

  Widget _detailsCard() {
    getPhone();
    getAddress();
    getExchangePost();
    getYearOfBirth();
    getGender();
    print(_profile);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.email),
              title: Text(email.trim()),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text(_birthDay.trim()),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.male),
              title: Text(gender.trim()),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(phone.trim()),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(address!.trim()),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.post_add),
              title: Text(exchangePost.trim()),
            ),
          ],
        ),
      ),
    );
  }

  String _birthDay = "";
  void getYearOfBirth() {
    if (_profile!.yearOfBirth != null) {
      var str = _profile!.yearOfBirth;
      var part = str.split('T00:00:00');
      var prefix = part[0].trim();
      _birthDay = prefix.toString();
    }
  }

  String gender = "Nam";
  void getGender() {
    if (_profile!.gender != null) {
      if (_profile!.gender == 1) {
        gender = "Nam";
      } else if (_profile!.gender == 2) {
        gender = "Nữ";
      } else if (_profile!.gender == 3) {
        gender = "Khác";
      }
    }
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => EditProfileScreen()));
              },
              leading: Icon(Icons.edit),
              title: Text("Chỉnh sửa thông tin cá nhân"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              onTap: () {
                GoogleSingInProvider.signOutGoogle();
                // userEmail = "";
                // email = "";
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              leading: Icon(Icons.logout),
              title: Text("Đăng xuất"),
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return InkWell(
      onTap: () {
        GoogleSingInProvider.signOutGoogle();
        // userEmail = "";
        // email = "";
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      },
      child: Container(
          //width: MediaQuery.of(context).size.width * 0.60,
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 16),
                Text(
                  "Đăng xuất",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
