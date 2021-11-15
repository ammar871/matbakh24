import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/constans.dart';

class RowActivate extends StatelessWidget {

  var marketName;


  RowActivate(this.marketName);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff7cac21),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          marketName ?? "",
          style: TextStyle(
            fontFamily: 'home3',
            fontSize: 17,
            color: KTextColor,
            fontWeight: FontWeight.bold,
            // decoration: TextDecoration.underline,
            height: 2,
          ),
          textHeightBehavior:
          TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}