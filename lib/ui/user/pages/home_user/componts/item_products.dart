import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/best_claint/best_claint_screen.dart';
import 'package:matbahk24/ui/user/pages/category/category_screen.dart';
import 'package:matbahk24/ui/user/pages/details_product/product_details.screen.dart';
import 'package:matbahk24/widgets/load_photo2.dart';
T getRandomElement<T>(List<T> list) {
  final random = new Random();
  var i = random.nextInt(list.length);
  return list[i];
}
class ItemProduct extends StatelessWidget {
 Field food;


 ItemProduct(this.food);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pushPage(context:context,page:BestClientsScreen(food));
       // pushPage(context: context,page: ProductDetailsScreen(food));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: getRandomElement(images),
                height: 110,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                  child: Container(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(color: Colors.green,)),
                ),
                errorWidget: (context, url, error) => Container(
                    height: 110,
                    child: Center(
                        child: Icon(
                          Icons.error,
                          size: 25,
                        ))),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                      Colors.yellow.withOpacity(0.4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 180,
                    child:Text(food.name,style: TextStyle(color: Colors.black),),
                  ))
            ],
          ),
        ),
      ),
    ); /*Container(

        decoration: BoxDecoration(

        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:
                    LoadPhoto2(food.mainImage,120,enabled: false,)


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
                            '${food.price.toString()}\n ${tr("رس")}',
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
                fontSize: 16,
                color: const Color(0xff7cac21),
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
                fontSize: 14,
                color: const Color(0x9e1d1d1d),
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
      )*/

  }
}