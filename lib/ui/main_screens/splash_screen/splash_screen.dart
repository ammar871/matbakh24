import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/helpers.dart';

import 'componts/body_splash.dart';


class SplashScreen extends StatefulWidget {
 static String id="/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

     if(screenWidth==null){
       screenWidth = MediaQuery.of(context).size.width;
       screenHeight = MediaQuery.of(context).size.height;
     }
    return Scaffold(
      backgroundColor:Colors.white ,
      body: BodySplash(),
    );
  }
}
