import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/default_button.dart';

class BodyTrakingMandop extends StatefulWidget {
  @override
  _BodyTrakingMandopState createState() => _BodyTrakingMandopState();
}

class _BodyTrakingMandopState extends State<BodyTrakingMandop> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, 61.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.42796133580664, 61.085749655962),
              zoom: 12.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   right: 0,
        //   child: BarMandop(
        //     text1: "طلب 25339 قيد التوصيل",
        //     text2: "الزمن المتوقع  8 دقيقه",
        //     isfound: true,
        //   ),
        // ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(

            height: 200,
            width: double.infinity,

            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: .8, color: Color(0xffC9C9C9)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/call.svg"),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'منيرة الهدلق',
                                style: TextStyle(
                                  fontFamily: 'home',
                                  fontSize: 14,
                                  color: const Color(0xff313450),
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'مقدم خدمة',
                                style: TextStyle(
                                  fontFamily: 'home',
                                  fontSize: 12,
                                  color: const Color(0xff898a8f),
                                ),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        )),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: .8, color: Colors.white)),
                          child: Image.asset(
                            "assets/images/person.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: .8, color: Color(0xffC9C9C9)))),
                    child: ContainersSetps(1),
                  ),
                ),
                Expanded(
                  child: Container(

                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff464646),
                        border: Border(
                            bottom: BorderSide(
                                width: .8, color: Color(0xff464646)))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: DefaultButton(
                        height: 20,
                        onPress: () {},
                        color: KYellowColor,
                        text: "تم الاستلام",
                        colorText: KBluColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ContainersSetps extends StatelessWidget {
  int count=0;

  ContainersSetps(this.count);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: count==3?KGreenColor:Colors.grey

              ),
              child: Center(
                child: // Adobe XD layer: 'Travel' (text)
                Text(
                  '3',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffeeefff),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Icon(Icons.arrow_right_alt_outlined,size: 50,),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: count>=2?KGreenColor:Colors.grey

              ),
              child: Center(
                child: // Adobe XD layer: 'Travel' (text)
                Text(
                  '2',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffeeefff),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Icon(Icons.arrow_right_alt_outlined,size: 50,),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: count>=1?KGreenColor:Colors.grey
              ),
              child: Center(
                child: // Adobe XD layer: 'Travel' (text)
                Text(
                  '1',
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffeeefff),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 55,
              margin: EdgeInsets.only(top: 10),

              child: Center(
                child: // Adobe XD layer: 'Travel' (text)
                Text(
                  "تم\n تسليم \nالطلب",
                  style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: count>=3?KHomeColor:Colors.grey
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),            SizedBox(width: 50,),
            Container(
              width: 55,
              margin: EdgeInsets.only(top: 10),

              child: Center(
                child: // Adobe XD layer: 'Travel' (text)
                Text(
                  "المندوب \nفي\n الطريق",
                  style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: count>=2?KGreenColor:Colors.grey
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),


            SizedBox(width: 50,),
            Container(
              width: 55,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: // Adobe XD layer: 'Travel' (text)
                Text(
                  'جاري\n تجهيز \nالطلب',
                  style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: count>=1?KGreenColor:Colors.grey
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}