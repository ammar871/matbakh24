import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';
import 'package:matbahk24/ui/user/pages/details_product/product_details.screen.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/details_client_screen.dart';
import 'package:matbahk24/widgets/load_photo2.dart';

import 'container_type.dart';

class ItemLastedClients extends StatelessWidget {
  Market market;

  ItemLastedClients(this.market);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      pushPage(context:context,page:DetailsClientScreen(market));
      },
      child:Card(
        color: Colors.white,
        margin: EdgeInsets.only(top: 8,bottom: 10),
        elevation:1,
        child: Container(

          height: 210,
          width: double.infinity,
          decoration: BoxDecoration(

          ),

          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: LoadPhoto2(
                        filesUrl + market.bannarImage,
                        100,
                        enabled: false,
                        w: double.infinity,
                      )),
                ),
              ),
              Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LoadPhoto2(
                          filesUrl + market.image,
                          60,
                          enabled: false,
                          w: double.infinity,
                        )),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0,right:8.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,

                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        market.title,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontFamily: 'home',
                                          fontSize: 11.5,
                                          color: const Color(0xff200e32),
                                          fontWeight: FontWeight.w700,
                                          height: 1.7,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 3,),

                                  ],
                                ),
                                RatingBarBest(market.rate.toString()),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children:(market.fields.length>3? market.fields.sublist(0,3):market.fields).map((e) {
                                  return Container(
                                      margin: EdgeInsets.symmetric(horizontal: 2),
                                      child: ContainerType(e.name));
                                }).toList(),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                market.distance,
                                style: TextStyle(
                                  fontFamily: 'home',
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w300,
                                  height: 1.4166666666666667,
                                ),
                                textHeightBehavior:
                                TextHeightBehavior(applyHeightToFirstAscent: false),
                                textAlign: TextAlign.start,
                              ),
                              // Adobe XD layer: 'Home' (text)
                              // Adobe XD layer: 'Home' (text)

                              SizedBox(
                                width: 10,
                              )
                            ],
                          )
                        ],

                      ),
                    ),
                  )),
            ],
          ),

          // child: Stack(
          //   children: [
          //     ClipRRect(
          //         borderRadius: BorderRadius.circular(5),
          //         child: LoadPhoto2(
          //           filesUrl + market.image,
          //           120,
          //           enabled: false,
          //           w:double.infinity,
          //         ))
          //   ],
          // ),
        ),
      ) /*Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color(0xFFE2E2E2),
        ))),
        margin: EdgeInsets.all(5),
        height: 80,
        child: Row(
          children: [

            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child:
                LoadPhoto2(filesUrl+market.image,50,enabled: false,)

              ),
            ),
            SizedBox(width: 20,),
            Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            market.title,
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 12,
                              color: const Color(0xff200e32),
                              fontWeight: FontWeight.w700,
                              height: 1.4166666666666667,
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            width: 10,
                          ),

                          RatingBarBest(market.rate),
                          // Adobe XD layer: 'Home' (text)
                          SizedBox(
                            width: 20,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children:(market.fields.length>3? market.fields.sublist(0,3):market.fields).map((e) {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2),
                                  child: ContainerType(e.name));
                            }).toList(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            market.distance,
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.w300,
                              height: 1.4166666666666667,
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.start,
                          ),
                          // Adobe XD layer: 'Home' (text)
                          // Adobe XD layer: 'Home' (text)

                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                )),

            // Container(
            //   height: 110,
            //   child: SvgPicture.asset(
            //     "assets/icons/icon_best.svg",height: 18,width: 18,),
            // ),
          ],
        ),
      )*/,
    );
  }
}
