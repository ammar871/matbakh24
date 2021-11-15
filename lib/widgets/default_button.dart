

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final String text;
  final Function onPress;
  final Color color;
  final Color colorText;

  DefaultButton(
      {required this.height,
        required this.text,
        required this.onPress,
        required this.color,
      required this.colorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        onPressed: () => onPress(),
        color: color,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 17,
            color: colorText ,
            letterSpacing: 0.8500000000000001,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}