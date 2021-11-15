import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';

import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/user/pages/home_user/componts/title_bar_home.dart';

import '../home_user_screen.dart';
import 'RichTextCategories.dart';
import 'list_categries.dart';
import 'list_products.dart';

class BodyUserHome extends StatelessWidget {
  List<Food> foods=[] ;

  BodyUserHome(this.foods);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarHomeUser(),
          SizedBox(
            height: 10,
          ),
          Text(
            'احدث الاضافات'.tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 16,
              color: const Color(0xff383838),
              fontWeight: FontWeight.w700,
              height: 1.625,
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            width: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                // StylesWidget.getSvg("assets/icons/back_reight.svg", 20, 20),
                // Icon(Icons.arrow_back_ios),
                Expanded(child: ListCategories(foods)),
                // Icon(Icons.arrow_forward_ios),

                // StylesWidget.getSvg("assets/icons/back_left.svg", 20, 20),
              ],
            ),
          ),

     /*     SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'نعرض لك في هذا الجزء احدث ما اضيف من اكلات خلال الفترة السابقة نحن متاكدين انك ستجد الأنسب لك هنا'.tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 12,
                color: const Color(0x9e383838),
                height: 1.6666666666666667,
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.start,
            ),
          ),*/
          RichTextCategories(),
          SizedBox(
            height: 20,
          ),
          ListProducts(fields),
          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
