import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/default_button.dart';

import 'BarAddMeal.dart';
import 'FormAddMeal1.dart';

class BodyAddMeal1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarAddMeal(1,'اضافة وجبة جديدة'.tr()),
          // Adobe XD layer: 'Food' (text)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'انت الان علي وشك اضافة وجبة جديدة لصفحتك و يشاهدها الاف المشتركين . من الجيد ان يكون وصفك واضح وصريح و كذلك الصور لابد ان تكون جذابة و واضحة. بعد الانتهاء من اضافة وجبه سيمرر طلبك لادارة التطبيق فقط للتاكد من معايير المنصة و في حال الموافقة سوف تنشر تلقائيا وسيصلك اشعار. '.tr(),
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14.5,
                    color: const Color(0x99000000),
                    height: 2.2,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'بعد اتمام اضافتك ! قد يستغرق الامر حتي 73 ساعه لكي تراجعه الإدارة و توافق علي نشره'.tr(),

                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14.5,

                    color: const Color(0xffff0000),
                    fontWeight: FontWeight.w700,
                    height: 2.2,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.start,
                ),
                FormAddMeal1()
              ],
            ),
          )
        ],
      ),
    );
  }
}




