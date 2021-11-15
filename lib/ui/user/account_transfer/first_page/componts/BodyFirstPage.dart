import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/helpers.dart';


import '../../BarAccountTransfer.dart';
import 'FieldsWidget.dart';

class BodyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          BarAccountTransfer(),
          SizedBox(
            height: 20,
          ),
          FieldsWidget(),
        ],
      ),
    );
  }
}




