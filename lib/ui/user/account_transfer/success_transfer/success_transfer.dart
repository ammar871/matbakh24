import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'body_success_transfer/BodySuccessTransfer.dart';

class SuccessTransfer extends StatelessWidget {
  static String id="/SuccessTransfer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          onPressed: () {
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
      body: BodySuccessTransfer(),
      backgroundColor: Color(0xffF2F4F3),
    );
  }
}
