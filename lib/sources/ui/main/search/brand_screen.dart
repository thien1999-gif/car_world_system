import 'package:car_world_system/sources/bloc/accessory_bloc.dart';
import 'package:car_world_system/sources/model/brand.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BrandScreen extends StatefulWidget {
  final int id;
  const BrandScreen({Key? key, required this.id}) : super(key: key);

  @override
  _BrandScreenState createState() => _BrandScreenState(id);
}

class _BrandScreenState extends State<BrandScreen> {
  final int id;

  _BrandScreenState(this.id);
  @override
  void initState() {
    super.initState();
    accessoryBloc.getBrandDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: accessoryBloc.brandDetail,
          builder: (context, AsyncSnapshot<Brand> snapshot) {
            if (snapshot.hasData) {
              return _builBrandDetail(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _builBrandDetail(Brand data) {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 10.h,
                  height: 10.h,
                  child: Image(
                    image: NetworkImage(data.image),
                  ),
                ),
                SizedBox(
                  width: 1.h,
                ),
                Expanded(
                  child: Column(
                    children: [Text(data.name,style: TextStyle(fontWeight: FontWeight.bold,),), 
                    Text(data.description, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blue))],
                  ),
                ),
              ],
            )));
  }
}
