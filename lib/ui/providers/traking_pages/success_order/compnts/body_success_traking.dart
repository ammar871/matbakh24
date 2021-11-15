import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/default_button.dart';
class BodSuccessTraking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/sucessAdd.svg"),
                  SizedBox(height: 25,),
                
                  Text(
                    'تهانينا لقد تم الطلب بنجاح. جزاك الله خير',
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 20,
                      color: const Color(0xff000000),
                      height: 1.1,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  )
                ],
              ) ,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            child: Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
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
                    'طلب 25339 تم لتوصيل',
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
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                color: Color(0xff464646),
                border: Border(
                    bottom: BorderSide(width: .8, color: Color(0xff464646)))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: DefaultButton(
                height: 20,
                onPress: () {},
                color: KYellowColor,
                text: "الرجوع",
                colorText: KBluColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
