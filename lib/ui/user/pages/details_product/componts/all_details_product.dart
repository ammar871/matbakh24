import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/pages/details_product/componts/texts_details.dart';

import 'images_product_list.dart';
import 'my_custom_clipper.dart';

class AllDetailsProducts extends StatelessWidget {
  final Food food;
  AllDetailsProducts({
    required this.food,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(

          child: Column(
            children: [
              // Positioned(
              //   top: 0,
              //   child: ClipPath(
              //     child: Container(
              //       width: MediaQuery.of(context).size.width,
              //       height: 250,
              //       color: KYellowColor,
              //     ),
              //     clipper: MyCustomClipper(),
              //   ),
              // ),

              ImagesProductsList(food),
              NameProductText(food),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topRight,
                child: Text(
                  ' ${tr("السعر")}  ${food.price.toString()} ${tr("رس")} ',
                  style: TextStyle(
                    fontFamily: 'home3',
                    fontSize: 15,
                    color:  const Color(0xffffd700),
                    letterSpacing: 0.11250000715255737,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          child: Text(
            "مدة التحضير : ".tr()+"${food.preparationTime.toString()} ${tr("د")} ",
            style: TextStyle(
              fontFamily: 'home3',
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w300,
              height: 2,
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TitleText('وصف عام'.tr()),
        SizedBox(
          height: 15,
        ),
        TextDetails(text: food.desc),
        SizedBox(
          height: 25,
        ),
        // TitleTextOrder("الحجم ".tr()),
        // SizedBox(
        //   height: 10,
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Text(
        //         '  ${food.persons.toString()}' + "  " + "أفراد".tr(),
        //         style: TextStyle(
        //           fontFamily: 'home3',
        //           fontSize: 12,
        //           color: const Color(0xffffffff),
        //           letterSpacing: 0.09000000572204589,
        //           fontWeight: FontWeight.w700,
        //         ),
        //         textAlign: TextAlign.start,
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 15,
        // ),
        DescOrder(food),
        SizedBox(
          height: 15,
        ),
        TitleTextOrder('ملاحظات'.tr()),
        SizedBox(
          height: 10,
        ),
        TextDetails(
          text: food.notes,
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
