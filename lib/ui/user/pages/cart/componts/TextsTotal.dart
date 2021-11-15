import 'package:flutter/cupertino.dart';

class TextsTotal extends StatelessWidget {
  final String text1;
  final String text2;

  TextsTotal({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Adobe XD layer: 'Travel' (text)

          Text(
            text1,
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 14.5,
              color: const Color(0xff200e32),
            ),
            textAlign: TextAlign.start,
          )
,
          Text(
            text2,
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 14.5,
              color: const Color(0xff200e32),
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}