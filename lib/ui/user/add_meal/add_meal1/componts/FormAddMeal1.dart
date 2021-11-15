import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal2/add_meal2_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/componts/BodyAddMeal3.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/textfields.dart';

class FormAddMeal1 extends StatefulWidget {
  @override
  _FormAddMeal1State createState() => _FormAddMeal1State();
}

class _FormAddMeal1State extends State<FormAddMeal1> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),


          TextFields(
            lable: "عنوان الوجبة - حتي 30 حرف".tr(),
            horizontalMargin: 0,
            height: 55,
            maxLines: 1,

            maxLength: 30,
            onChange: (v){
              addFoodParams['name']= v.toString();
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFields(
            lable: "سعر الوجبة".tr(),
            horizontalMargin: 0,
            keyboard: TextInputType.number,
            formator: [new WhitelistingTextInputFormatter(RegExp("[1-9]"))],
            onChange: (v){
              addFoodParams['price']= v.toString();
            },
            height: 55,
          ),
          SizedBox(
            height: 15,
          ),

          TextFields(
            lable: "مدة التحضير".tr(),
            horizontalMargin: 0,
            keyboard: TextInputType.number,

            onChange: (v){
              addFoodParams['preparation_time']= v.toString();
            },
            height: 55,
          ),

          SizedBox(
            height: 15,
          ),

          TextFields(
            lable: "وصف مختصر عن الوجبة - حتي 200 كلمة".tr(),
            horizontalMargin: 0,
            maxLines: 7,
            radius: 27,
            onChange: (v){
              addFoodParams['desc']= v.toString();
            },
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
            height: 25,
          ),

          DefaultButton(
              height: 55,
              text: "التالى".tr(),
              onPress: () {
                if(_formKey.currentState!.validate())
                Navigator.of(context).pushNamed(AddMeal2Screen.id);
              },
              color: KHomeColor,
              colorText: Colors.white
          )
        ],
      ),
    );
  }

  // showOverlay(BuildContext context) {
  //   if (overlayEntry != null) return;
  //   OverlayState? overlayState = Overlay.of(context);
  //   overlayEntry = OverlayEntry(builder: (context) {
  //     return Positioned(
  //         bottom: MediaQuery.of(context).viewInsets.bottom,
  //         right: 0.0,
  //         left: 0.0,
  //         child: InputDoneView());
  //   });
  //
  //   overlayState.insert(overlayEntry);
  // }
  //
  // removeOverlay() {
  //   if (overlayEntry != null) {
  //     overlayEntry.remove();
  //     overlayEntry = null;
  //   }
  // }
}

