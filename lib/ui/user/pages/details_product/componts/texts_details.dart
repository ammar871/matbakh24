import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/ui/user/pages/details_product/componts/row_activate.dart';

import 'image_product.dart';


class NameProductText extends StatelessWidget {

  Food food;


  NameProductText(this.food);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text(
              food.name
              ,
              maxLines: 3,
              style: TextStyle(
                fontFamily: 'home3',
                fontSize: 20,
                color:  Colors.white,
                letterSpacing: 0.15000000953674317,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          RowActivate(food.marketName),

          // Adobe XD layer: '✏️ Page Title' (text)

          // DescProductTexts(food),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}

class TextDetails extends StatelessWidget {
  const TextDetails({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 12,
          fontFamily: "home3",
          color: Colors.white,
          letterSpacing: 0.09000000572204589,
        ),
      ),
    );
  }
}

class TitleTextOrder extends StatelessWidget {
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'home3',
              fontSize: 12,
              color: const Color(0xffffd700),
              letterSpacing: 0.09000000572204589,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  TitleTextOrder(this.text);
}

class TitleText extends StatelessWidget {
  final String text;

  TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'home3',
              fontSize: 20,
              color: const Color(0xffffffff),
              letterSpacing: 0.15000000953674317,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
// class DescProductTexts extends StatelessWidget {
// Food food;
//
//
//
// DescProductTexts(this.food);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.start,
//         //   children: types.map((e) {
//         //     return Padding(
//         //       padding: const EdgeInsets.symmetric(horizontal: 4),
//         //       child: Text(
//         //         e,
//         //         style: TextStyle(
//         //           fontFamily: 'home3',
//         //           fontSize: 14.5,
//         //           color: const Color(0xff000000),
//         //           fontWeight: FontWeight.w300,
//         //           decoration: TextDecoration.underline,
//         //           height: 2,
//         //         ),
//         //         textHeightBehavior:
//         //         TextHeightBehavior(applyHeightToFirstAscent: false),
//         //         textAlign: TextAlign.start,
//         //       ),
//         //     );
//         //   }).toList(),
//         // ),
//       ],
//     );
//   }
// }

class DescOrder extends StatelessWidget {
 Food food;


 DescOrder(this.food);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                TitleTextOrder("طريقة التقديم ".tr()),
                SizedBox(
                  height: 10,
                ),
                TextDetails(
                  text:
                  food.serveWay,
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: .35),
          width: 2,
          color: Color(0xFF707070),
          height: 100,
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextOrder("المرفقات ".tr()),
                SizedBox(
                  height: 10,
                ),
                TextDetails(
                  text:
                  food.attatchments,
                ),
              ],
            ))
      ],
    );
  }
}