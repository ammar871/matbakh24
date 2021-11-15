import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/main_screens/validate_number/componts/card_validate.dart';

class BodyValidate extends StatelessWidget {
  BodyValidate();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  )),
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
                  CardValidate(),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
