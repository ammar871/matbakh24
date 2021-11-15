import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';

import 'card_signUp.dart';

class BodySignUp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();

      },
      child: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                    right: -10,
                    top: 200,
                    child: SvgPicture.asset(
                      "assets/icons/path.svg",

                    ) ),
                Column(
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    SvgPicture.asset(
                      "assets/icons/MainLogo.svg",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CardSignUp(),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(LoginScreen.id);
                      },
                      child:Text(
                        'لدي حساب اريد الدخول به'.tr(),
                        style: TextStyle(
                          fontFamily: 'home',
                          fontSize: 13,
                          color: const Color(0xff464646),
                          letterSpacing: 0.7000000000000001,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
