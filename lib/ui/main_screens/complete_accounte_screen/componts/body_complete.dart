import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/ui/main_screens/complete_accounte_screen/componts/Card_complete.dart';
import 'package:matbahk24/ui/main_screens/sign_up/componts/card_signUp.dart';

class BodyCompleteAccount extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();

      },
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  right: -10,
                  top: 200,
                  child: SvgPicture.asset(
                    "assets/icons/path2.svg",

                  ) ),
              Column(
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  SvgPicture.asset(
                    "assets/icons/MainLogo.svg",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CardComplete(),
                  SizedBox(
                    height: 8,
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
