import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:provider/provider.dart';
import 'componts/body_user_home.dart';
class HomeUserScreen extends StatefulWidget {
  static String id = "/home_user";
  @override
  _HomeUserScreenState createState() => _HomeUserScreenState();
}
class _HomeUserScreenState extends State<HomeUserScreen> {
  var fieldProvider;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    if(fieldProvider==null){
      fieldProvider=Provider.of<FieldProvider>(context);
      WidgetsBinding.instance?.addPostFrameCallback((_){
        fieldProvider.getHome(context);
      });
    }
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F3),
      body:RefreshIndicator(
          onRefresh: () async {
            return await fieldProvider.getHome(context);
          },
          child: ListView(
              shrinkWrap: true,
              children:[
            BodyUserHome(fieldProvider.foods)
          ])),
    );
  }
}


