import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/body_complete_order.dart';

class CompleteOrderScreen extends StatelessWidget {
  static String id="/CompleteOrderScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),

        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichTextTitle(Color(0xff000000)),
          ],
        ),
      ),
      backgroundColor: Color(0xffF2F4F3),
      body: BodyCompletedOrder(),
      drawer: MyDrawer(),
    );
  }
}
