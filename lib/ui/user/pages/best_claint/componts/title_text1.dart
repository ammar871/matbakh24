import 'package:flutter/cupertino.dart';

class TitleText1 extends StatelessWidget {
  final String text;

  TitleText1(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 15,
            color: const Color(0xff200e32),
            letterSpacing: 0.11250000715255737,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}