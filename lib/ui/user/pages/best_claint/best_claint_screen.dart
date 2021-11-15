import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';
import 'package:provider/provider.dart';

import 'componts/body_best_client.dart';
class BestClientsScreen extends StatelessWidget {

 Field field;

 BestClientsScreen(this.field);
 var _fieldProvider;

 @override
  Widget build(BuildContext context) {
    if(_fieldProvider==null){
      _fieldProvider= Provider.of<FieldProvider>(context);
      WidgetsBinding.instance?.addPostFrameCallback((_){
        _fieldProvider.getFieldMarkets(context, field.id);

      });

    }
    return  Scaffold(
      backgroundColor: Color(0xFFF2F4F3),
      appBar:  AppBar(
        leading: IconButton(
          onPressed: (){
            pop(context);
          },
          icon: Icon(
            Icons.arrow_back,color: Colors.white,
          ),
        ),
        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichTextTitle(Colors.white),
          ],
        ),
      ),
     body: BodyBestClient(_fieldProvider.markets),
    );
  }
}
