import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';

class BodySplash extends StatefulWidget {


  @override
  _BodySplashState createState() => _BodySplashState();
}

class _BodySplashState extends State<BodySplash> with SingleTickerProviderStateMixin  {

  late AnimationController animationController;

  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    await readToken();
    isRegistered()?
        checkUserRole(context):
    Navigator.of(context).pushReplacementNamed(LoginScreen.id);
  }

  var startAnimation = false;
  initialTimer() async {
    await new Future.delayed(const Duration(seconds:1));
    setState(() {
      startAnimation = true;
    });
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   initialTimer();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();


    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [

          // Positioned(
          //     right: -60,
          //     top: -80,
          //     child: Container(
          //       decoration: StylesWidget.getBoxDecorationCircle(
          //           KBrownColor.withOpacity(.5)),
          //       height: 230,
          //       width: 230,
          //     )),
          Positioned(
              left: -40,
              top: -40,
              child: Container(
                decoration: StylesWidget.getBoxDecorationCircle(KYellow3Color),
                height: 100,
                width: 100,
              )),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: 0,
            left: 0,
            right: 0,
            bottom: startAnimation?  0:MediaQuery.of(context).size.height* 0.4,
            child: Image.asset("assets/images/logo.png",width: 150,
            height: 150,),
          ),
          AnimatedPositioned(
              right: -20,
              bottom: startAnimation ? 120 : 20,
              duration: Duration(seconds: 1),
              child: AnimatedOpacity(

                duration: Duration(seconds: 1),
                opacity: startAnimation? 1:0.0,
                child: Container(
                  decoration: StylesWidget.getBoxDecorationCircle(KYellow3Color),
                  height: 100,
                  width: 100,
                ),
              )),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
              left: startAnimation ?-40 :-70,
              bottom: startAnimation ?-40 :-70,
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: startAnimation? 1:0.0,
                child: Container(
                  decoration: StylesWidget.getBoxDecorationCircle(
                      Color(0x75ffdd2c).withOpacity(.2)),
                  height: 200,
                  width: 200,
                ),
              )),

        ],
      ),
    );
  }
}
class MyClipper  extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 90);
    var controllPoint = Offset(70,size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
