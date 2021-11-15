import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';

class BodyCompletedOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(

        children: [
      Container(
        width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
      decoration: BoxDecoration(
          color: KYellowColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: BarComplete(),
    ),

          SizedBox(height: 30,),
          // Adobe XD layer: '✏️ Page Title' (text)
          Text(
            'تهانينا'.tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 20,
              color: const Color(0xff200e32),
              letterSpacing: 0.15000000953674317,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          SvgPicture.asset("assets/icons/success.svg",width: 200,height: 200,),

          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'لقد تم تسجيل الطلب بنجاح لمراجعه الطلب او للتواصل معنا برجاء الذهاب الي الاعدادات واختيار الطلبات'.tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 14.5,
                color: const Color(0x99000000),
                height: 2.2,
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: (){
              pushPage(context: context,page: NavigationPage(currentIndex: 2,));
            },
            child: Text(
              'الرجوع للرئيسية'.tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 16,
                color: const Color(0xffff0000),
                letterSpacing: 0.12000000762939453,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class BarComplete extends StatelessWidget {
  const BarComplete({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'اتمام الطلب'.tr(),
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 20,
            color: const Color(0xff200e32),
            letterSpacing: 0.15000000953674317,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'مراجعة الطلبات '.tr(),
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 9,
            color: const Color(0xff383838),
            height: 2,
          ),
          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.left,
        ),


      ],
    );
  }
}
