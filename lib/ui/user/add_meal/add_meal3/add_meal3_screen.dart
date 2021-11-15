import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/BodyAddMeal3.dart';

class AddMeal3Screen extends StatelessWidget {
  static String id="/AddMeal3Screen";

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();

      },
      child: Scaffold(
        appBar:  AppBar(
          leading: BackButton(),

          backgroundColor: KYellowColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichTextTitle(Color(0xff000000)),
            ],
          ),
        ),
        body: BodyAddMeal3(),
        backgroundColor: Color(0xffF2F4F3),
      ),
    );
  }
}
