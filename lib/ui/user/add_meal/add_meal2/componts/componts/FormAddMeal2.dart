import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/add_meal3_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/componts/BodyAddMeal3.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/textfields.dart';

class FormAddMeal2 extends StatefulWidget {
  @override
  _FormAddMeal2State createState() => _FormAddMeal2State();
}

class _FormAddMeal2State extends State<FormAddMeal2> {
  String? currentVale;
  String? currentVale2;
  String? info;
  int count = 1;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        key:_formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "مرفقات الوجبة".tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 15,
                color: const Color(0xff200e32),
                letterSpacing: 0.15000000953674317,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            TextFields(
              lable: "مرفقات الوجبة - حتي 200 كلمة".tr(),
              horizontalMargin: 0,
              maxLines: 7,
              onChange: (v){
                addFoodParams['attatchments']= v.toString();
              },
              radius: 27,
              height: 110,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '200 كلمة متاح'.tr(),
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 14.5,
                      color: const Color(0xff000000),
                      height: 2.2,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "طريقة التقديم".tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 15,
                color: const Color(0xff200e32),
                letterSpacing: 0.15000000953674317,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            TextFields(
              lable: "طريقة التقديم - حتي 200 كلمة".tr(),
              horizontalMargin: 0,
              maxLines: 7,
              onChange: (v){
                addFoodParams['serve_way']= v.toString();
              },
              radius: 27,
              height: 110,
            ),
            SizedBox(
              height: 5,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '200 كلمة متاح'.tr(),
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 14.5,
                      color: const Color(0xff000000),
                      height: 2.2,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            DefaultButton(height: 55, text: "التالى".tr(), onPress: (){
              if(_formKey.currentState!.validate())
                Navigator.of(context).pushNamed(AddMeal3Screen.id);
            }, color: KHomeColor, colorText: Colors.white)
          ],
        ),
      ),
    );
  }
}