import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/container_type.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';
import 'package:matbahk24/widgets/load_photo2.dart';

import 'my_clipper.dart';

class HeaderDetailsClients extends StatelessWidget {
   Market market;


   HeaderDetailsClients(this.market);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 270,
      child: Stack(

        children: [
         Positioned(
             top: 0,
left: 0,
             right: 0,
             child: Container(
           width: double.infinity,
           height: 200,
           child: LoadPhoto2(filesUrl+market.bannarImage,250,w: 700.0,),
         )),
          Positioned(
              top: 130,
              left: 10,
              right: 10,
              child: Container(
            width: double.infinity,


            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
             child: Column(
               children: [
                 SizedBox(
                   height: 2,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [

                       Text(
                         market.title,
                         maxLines: 1,
                         style: TextStyle(

                           fontFamily: 'home',
                           fontSize: 15,
                           color: Colors.black,
                           fontWeight: FontWeight.w700,
                         ),

                         textHeightBehavior:
                         TextHeightBehavior(applyHeightToFirstAscent: false),
                         textAlign: TextAlign.center,
                       ),

                       RatingBarBest(market.rate),
                     ],
                   ),

                 ),
                 Padding(padding: EdgeInsets.symmetric(vertical: 3,horizontal: 8)
                   ,child: Row(
                     children: [
                       Text(
                         'نبذة'.tr(),
                         style: TextStyle(
                           fontFamily: 'home',
                           fontSize: 10,
                           color: Colors.black,
                           letterSpacing: 0.11250000715255737,
                           fontWeight: FontWeight.w700,
                         ),
                         textAlign: TextAlign.start,
                       ),
                       SizedBox(
                         width: 10,
                       ),
                       SizedBox(
                         width: 220,
                         child: Text(
                             market.summary,
                             textAlign: TextAlign.start,
                             maxLines: 2,
                             style:  TextStyle(
                               fontFamily: 'home',
                               fontSize: 13,
                               color: Colors.black,
                               letterSpacing: 0.11250000715255737,
                               fontWeight: FontWeight.w700,
                             )
                         ),
                       ),
                     ],

                   ),),
                Padding(padding: EdgeInsets.symmetric(vertical: 3,horizontal: 8)
                ,child: Row(
                    children: [
                      Text(
                        'التصنيف'.tr(),
                        style: TextStyle(
                          fontFamily: 'home',
                          fontSize: 10,
                          color: Colors.black,
                          height: 2.8333333333333335,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: market.fields.map((e) {
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              child: ContainerType(e.name));
                        }).toList(),
                      ),
                    ],

                  ),),
                 SizedBox(
                   height: 10,
                 ),
               ],
             ),


          ))

        ],
      ),
    );
  }
}
/*
ClipPath(
clipper: MyClipper(),
child: Container(
width: 1700.0,
child:LoadPhoto2(filesUrl+market.bannarImage,250,w: 700.0,)

),
),
Positioned(
bottom: -7,
left: 0,
right: 0,
child: Container(
child: Column(
children: [
Container(
padding: EdgeInsets.all(10),
height: 90,
width: 90,
decoration: BoxDecoration(
color: KBlack2Color, shape: BoxShape.circle),
child: Center(
child: ClipRRect(
borderRadius: BorderRadius.circular(50),
child:LoadPhoto2(filesUrl+market.image,70)

),
),
),

RatingBarBest(market.rate),
// Adobe XD layer: 'Home' (text)
Text(
market.title,
maxLines: 1,
style: TextStyle(
fontFamily: 'home',
fontSize: 25,
color: const Color(0xffffd700),
fontWeight: FontWeight.w700,
),
textHeightBehavior:
TextHeightBehavior(applyHeightToFirstAscent: false),
textAlign: TextAlign.center,
)
],
),
))*/
