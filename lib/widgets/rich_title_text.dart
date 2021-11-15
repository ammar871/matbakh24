import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';

class RichTextTitle extends StatelessWidget {
final Color color;


RichTextTitle(this.color);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'مطبخ'.tr()+" ",
        style: TextStyle(
            fontFamily: 'home3',
            fontSize: 23,
            color: color,
            fontWeight: FontWeight.w200),
        children: <TextSpan>[
          TextSpan(
              text: '24',
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 25,
                color: color ,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}