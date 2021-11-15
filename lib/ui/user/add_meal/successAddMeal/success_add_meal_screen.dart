import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/provider_account_detail/provider_account_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/componts/BodyAddMeal3.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/body_success_add_meal.dart';

class SuccessAddMealScreen extends StatelessWidget {
 static String id ="/SuccessAddMealScreen";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          onPressed: () {
            onComplete();
            popMultiplePages(context, 3);

          },
          icon: Icon(
            Icons.arrow_back,
            color: KBluColor,
          ),
        ),
        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichTextTitle(Color(0xff000000)),

          ],
        ),
      ),
      body: BodySuccessAddMeal(),
      backgroundColor: Color(0xffF2F4F3),
    );
  }
}
