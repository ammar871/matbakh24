import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/BarAddMeal.dart';



import 'FormAddMeal2.dart';

class BodyAddMeal2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarAddMeal(2,'اضافة وجبة جديدة'.tr()),
          FormAddMeal2(),
        ],
      ),
    );
  }
}


