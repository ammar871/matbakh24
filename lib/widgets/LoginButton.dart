import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';

import 'default_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Center(
        child: DefaultButton(
          colorText: Color(0xffffffff),
          height: 50,
          text: "تسجيل الدخول".tr(),
          onPress: () {
            replacePage(context: context,page: LoginScreen());
          },
          color: KHomeColor,
        ),
      ),
    );
  }
}
