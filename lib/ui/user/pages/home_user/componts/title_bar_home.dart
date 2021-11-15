import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/user/UserAddress/SearchScreen.dart';

class BarHomeUser extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: (){
        pushPage(context:context,page:SearchScreen());
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
        decoration: BoxDecoration(
            color: KYellowColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:20,
                    ),
                    Icon(Icons.search, color: const Color(0xffb7bec6)),
                    SizedBox(
                      width:20,
                    ),
                    Text(
                      'اكتب اسم المقدم الذي تبحث عنه'.tr(),
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 12,
                        color: const Color(0xffb7bec6),
                        height: 1.4285714285714286,
                      ),
                      textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      width: 10,
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مقدمي خدمة في منطقتي و مناطق قريبة'.tr(),
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14,
                    color: const Color(0xffede9f1),
                    height: 2,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 20,
                ),
                StylesWidget.getSvg("assets/icons/pin.svg", 15, 15,)
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}