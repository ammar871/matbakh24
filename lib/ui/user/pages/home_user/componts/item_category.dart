import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/best_claint/best_claint_screen.dart';
import 'package:matbahk24/ui/user/pages/details_product/product_details.screen.dart';
import 'package:matbahk24/widgets/load_photo2.dart';

class ItemCategory extends StatelessWidget {
  Food field;

  ItemCategory(this.field);


  _showBottomSheetProducts(){



  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){

        _showBottomSheetProducts();


        pushPage(context: context,page: ProductDetailsScreen(field));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(

              width: 80,
              height: 80,

              decoration: BoxDecoration(
                 shape: BoxShape.circle),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child:
                  LoadPhoto2(field.mainImage,120,enabled: false,)


              ),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              field.name,
              style: TextStyle(
                fontFamily: 'home3',
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w200,
                height: 1.0833333333333333,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${field.price.toString()} ${tr("رس")}',
              style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 12.5,
                color: const Color(0xff7cac21),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ); /*GestureDetector(
      onTap: () {
        pushPage(context:context,page:BestClientsScreen(field));
      },
      child: Container(
        margin: EdgeInsets.all(3),
        width: 96.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.0),
          color: const Color(0xFFE2E2E2),
        ),
        child: // Adobe XD layer: 'Home' (text)
            Center(
          child: Text(
            field.name,
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: const Color(0xff200e32),
              height: 1.4545454545454546,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );*/
  }
}
