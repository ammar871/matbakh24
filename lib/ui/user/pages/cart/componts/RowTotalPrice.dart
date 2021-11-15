import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Provider/CartProvider.dart';

class RowTotalPrice extends StatelessWidget {
  const RowTotalPrice({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'المجموع'.tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 14.5,
              color: const Color(0xff200e32),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.start,
          ),
          Text.rich(

            TextSpan(
                children: [
                  TextSpan(
                    text: total,
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 19,
                      color: const Color(0xffff0000),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  TextSpan(
                      text: 'ر.س'.tr(),

                      style: TextStyle(

                        fontFamily: 'home',
                        fontSize: 14.5,
                        color: const Color(0xffff0000),
                        fontWeight: FontWeight.w700,
                      )),

                ]),
          ),

        ],
      ),
    );
  }
}