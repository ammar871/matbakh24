import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/helpers/constans.dart';

class StylesWidget {


  static BoxDecoration getDecoration(Color color) {
    return BoxDecoration(

      borderRadius: BorderRadius.circular(28.0),
      color: const Color(0xffe2e2e2),

    );
  }
  static SvgPicture getSvg(String icon,double width,double height) {
    return SvgPicture.asset(
      icon,
color: Colors.white,
      width: width,
      height: height,
    );
  }

  static TextStyle getTextStyle(Color colorFont, double fontSize) {
    return TextStyle(
      fontFamily: 'home',
      fontSize: fontSize,
      color: colorFont,
      height: 2.5,
    );
  }

  static BoxDecoration getBoxDecorationCircle(Color color) {
    return BoxDecoration(
      shape: BoxShape.circle,

      color: color,
    );
  }

}

final otpInputDecoration = InputDecoration(

  contentPadding:
  EdgeInsets.symmetric(vertical: 10),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);


OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(

  );
}
