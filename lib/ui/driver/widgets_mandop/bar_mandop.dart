
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/helpers/constans.dart';

class BarProvider extends StatelessWidget {
  final String text1,text2;
  bool isfound=false;


  BarProvider({required this.text1, required this.text2, required this.isfound});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
      decoration: BoxDecoration(
          color: KGreenColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [

          SizedBox(
            height: 15,
          ),
          Text(
            text1,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'home3',
              fontSize: 20,
              color: const Color(0xffffffff),
              letterSpacing: 0.15000000953674317,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          isfound ?Text(
            text2,
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 17,
              color: const Color(0xffffffff),
              height: 2,
            ),
            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.left,
          ):Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مقدمي خدمة في منطقتي و مناطق قريبة'.tr(),
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 14,
                  color: Colors.white,
                  height: 2,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset("assets/icons/pin.svg",width: 15,height: 15,color: Colors.white,)
            ],
          ),

          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}