import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';
import 'package:matbahk24/ui/user/pages/home_user/home_user_screen.dart';

import 'item_category.dart';

class ListCategories extends StatelessWidget {
  List<Food> foods=[] ;

  ListCategories(this.foods);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Center(
        child: ListView.builder(
            itemCount: foods.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return ItemCategory(foods[index]);
            }),
      ),
    );
  }
}
