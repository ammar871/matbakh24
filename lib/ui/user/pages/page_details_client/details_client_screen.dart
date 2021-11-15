import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/componts/body_details_client.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

class DetailsClientScreen extends StatelessWidget {
   Market market;

   DetailsClientScreen(this.market);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBlack2Color,

      appBar:  AppBar(

        leading: IconButton(
          onPressed: (){
            pop(context);
          },
          icon: Icon(
            Icons.arrow_back,color: Colors.white,
          ),
        ),
        iconTheme:IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichTextTitle(Colors.white),
          ],
        ),


      ),
      body: BodyDetailsClient(market),
    );
  }
}
