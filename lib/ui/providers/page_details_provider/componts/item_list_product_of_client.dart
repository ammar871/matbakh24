import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/details_product/product_details.screen.dart';
import 'package:matbahk24/widgets/load_photo2.dart';

class ItemListProductsOfClient extends StatelessWidget {
  Food food;

  ItemListProductsOfClient(this.food);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushPage(context:context,page:ProductDetailsScreen(food));
      },
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:LoadPhoto2(food.mainImage,screenWidth/2.5,enabled: false,)
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: KYellowColor,
                      child: Column(
                        children: [
                          Text(
                            '${food.price}\n ${tr("رس")}',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 14.5,
                              color: Color(0xff1d1d1d),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
             food.name,
              style: TextStyle(
                fontFamily: 'home3',
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w700,
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
             food.marketName,
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 10,
                color: const Color(0x9ee2e2e2),
                height: 1.7142857142857142,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
