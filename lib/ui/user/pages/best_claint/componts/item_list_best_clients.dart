import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/rating_bar_best.dart';
import 'package:matbahk24/ui/user/pages/page_details_client/details_client_screen.dart';
import 'package:matbahk24/widgets/load_photo2.dart';

import 'container_type.dart';

class ItemListBestClient extends StatelessWidget {
  Market market;

  ItemListBestClient(this.market);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          pushPage(context: context, page: DetailsClientScreen(market));
        },
        child: Card(
          color: Colors.white,
          elevation:1,
          child: Container(

            height: 190,
            width: 300,
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
                    height: 120,
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
                    child: Container(
                      height: 60,
                      width: double.infinity,

                      child: Padding(
                       padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(
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
                                    ContainerType(market.fields[0].name)
                                  ],
                                ),
                                RatingBarBest(market.rate.toString()),
                              ],
                            ),


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
        ) //Container(
        //   margin: EdgeInsets.symmetric(horizontal: 8),
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 70,
        //         width: 70,
        //         decoration: BoxDecoration(shape: BoxShape.circle),
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(100),
        //           child:LoadPhoto2( filesUrl+market.image,70,enabled: false,)
        //
        //
        //           // Image.network(
        //           //   market.image,
        //           //   height: 50,
        //           //   width: 50,
        //           //   fit: BoxFit.cover,
        //           // ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       RatingBarBest(market.rate.toString()),
        //
        //       Container(
        //         width: 100,
        //         child: Text(
        //           market.title,
        //           maxLines: 1,
        //           style: TextStyle(
        //             fontFamily: 'home',
        //             fontSize: 13.5,
        //             color: const Color(0xff200e32),
        //             fontWeight: FontWeight.w700,
        //             height: 1.7,
        //           ),
        //           textHeightBehavior:
        //               TextHeightBehavior(applyHeightToFirstAscent: false),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       ContainerType(market.fields[0].name)
        //     ],
        //   ),
        // ),
        );
  }
}
