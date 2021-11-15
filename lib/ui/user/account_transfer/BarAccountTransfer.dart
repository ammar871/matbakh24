import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/constans.dart';

class BarAccountTransfer extends StatelessWidget {
  const BarAccountTransfer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
      decoration: BoxDecoration(
          color: KYellowColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "طلب تحويل الحساب".tr(),
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
            'هذا الطلب يكون لمره واحده فقط'.tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 9,
              color: const Color(0xff383838),
              height: 2,
            ),
            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}