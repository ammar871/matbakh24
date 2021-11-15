import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/best_claint/best_claint_screen.dart';
import 'package:matbahk24/ui/user/pages/home_user/componts/item_products.dart';

import '../category_screen.dart';

class ItemListCategories extends StatelessWidget {
 var field;


 ItemListCategories(this.field);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pushPage(context:context,page:BestClientsScreen(field));
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
                    child:Text(field.name,style: TextStyle(color: Colors.black),),
                  ))
            ],
          ),
        ),
      ));

      GestureDetector(
      onTap: () {
        pushPage(context: context,page: BestClientsScreen(field));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 107.0,
        height: 106.0,
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
              fontWeight: FontWeight.w500,
              fontSize: 23,

              color: const Color(0xff200e32),
              height: 1.4545454545454546,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
