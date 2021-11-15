import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ContainerType extends StatelessWidget {
  final String text;

  ContainerType(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: .8,
            ),
          ],
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: // Adobe XD layer: 'Home' (text)
      Text(
        text,
        style: TextStyle(
          fontFamily: 'home',
          fontSize: 8,
          fontWeight: FontWeight.bold,
          color: const Color(0xff200e32),
          height: 2.8333333333333335,
        ),
        textHeightBehavior:
        TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.start,
      ),
    );
  }
}