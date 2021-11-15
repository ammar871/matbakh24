import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/ui/user/pages/details_product/componts/texts_details.dart';
import 'package:matbahk24/widgets/load_photo2.dart';

class ImageProduct extends StatelessWidget {
 Food food;


 ImageProduct(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 350,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(20),
        child:LoadPhoto2(food.mainImage,200)

      ),
    );
  }
}