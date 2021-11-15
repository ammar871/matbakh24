import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/BodyAddMeal1.dart';

class AddMealScreen extends StatelessWidget {
static String id ="AddMealScreen";


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
       appBar:  AppBar(
         leading: IconButton(
           onPressed: () {
             pop(context);
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
       body: BodyAddMeal1(),
        backgroundColor: Color(0xffF2F4F3),
      ),
    );
  }
}
