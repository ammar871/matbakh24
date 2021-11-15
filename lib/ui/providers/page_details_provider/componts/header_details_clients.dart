import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';
import 'package:matbahk24/widgets/load_photo2.dart';

import 'my_clipper.dart';

class HeaderDetailsClients extends StatelessWidget {
   Market market;


   HeaderDetailsClients(this.market);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Stack(
        children: [
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
              ))
        ],
      ),
    );
  }
}