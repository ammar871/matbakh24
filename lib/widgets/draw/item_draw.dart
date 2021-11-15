import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemDraw extends StatelessWidget {
  final String icon;
  final String text;
  final Function press;
  final Color color;

  ItemDraw(
      {required this.icon,
        required this.text,
        required this.press,
        required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset("assets/icons/$icon",color: color,)),
          SizedBox(
            width: 30,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.w300,
              height: 2.5,
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.start,
          ),

        ],
      ),
    );
  }
}