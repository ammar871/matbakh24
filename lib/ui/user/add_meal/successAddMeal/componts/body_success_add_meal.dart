import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/provider_account_detail/provider_account_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/BarAddMeal.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';

class BodySuccessAddMeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarAddMeal(3, "تمت الاضافة".tr()),
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset("assets/icons/sucessAdd.svg"),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'لقد تم تسجيل طلبك و ارساله لادارة التطبيق كل ماعليك هو انتظار انتهاء عملية التدقيق في الطلب . سيصلك اشعار بذلك عند الانتهاء. قد تستغرق عملية التدقيق 73 ساعة '.tr(),
              maxLines: null,
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
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              popMultiplePages(context, 4);
              replacePage(context: context,page: ProviderAccountScreen(currentUser.market));

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
          ),
        ],
      ),
    );
  }
}
