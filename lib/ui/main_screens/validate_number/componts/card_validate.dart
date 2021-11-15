import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/ui/main_screens/login_page/componts/form_login.dart';

import 'otp_form.dart';

class CardValidate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2.5,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/validate_icon.svg",
              ),
              Text(
                'ادخل رمز التحقق المرسل على جوالك'.tr()+ " : "+authProvider.code,
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 16,
                  color: const Color(0xff878787),
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              OtpForm(),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       '00.59',
              //       style: TextStyle(
              //         fontFamily: 'Droid Arabic Kufi',
              //         fontSize: 18,
              //         color: const Color(0xff878787),
              //         letterSpacing: 0.9,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //     SizedBox(width: 10),
              //
              //
              //     Text(
              //       'ارسل رمز جديد',
              //       style: TextStyle(
              //         fontFamily: 'Droid Arabic Kufi',
              //         fontSize: 16,
              //         color: const Color(0xff878787),
              //         letterSpacing: 0.8,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
