import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';

class EditFood extends StatefulWidget {

  @override
  _EditFoodState createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: KGreenColor,
          title: Text(
            "تعديل الوجبة",
            style: TextStyle(
                fontFamily: 'home3',
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),

    );
  }
}
