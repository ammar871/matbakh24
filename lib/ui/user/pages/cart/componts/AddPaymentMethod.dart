import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';

class AddPaymentMethod extends StatelessWidget {
  const AddPaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: KBluColor,
            size: 35,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'اختر طريقة الدفع'.tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 20,
              color: const Color(0xff022c43),
              letterSpacing: 0.15000000953674317,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}