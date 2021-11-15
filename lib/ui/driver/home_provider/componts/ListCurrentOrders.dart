import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:matbahk24/Model/Order.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/orderDetail/OrderDetail.dart';

class ListCurrentOrders extends StatelessWidget {
  List<Order> currentOrders = [];
  ListCurrentOrders(this.currentOrders,);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: currentOrders.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return ItemCurrentOrders(currentOrders[index]);
        });
  }
}

class ItemCurrentOrders extends StatelessWidget {
  Order order;


  ItemCurrentOrders(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: .5, color: Color(0xffE2E2E2)))),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffFFDD2C)),
            child: Center(
              child: // Adobe XD layer: 'Travel' (text)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${order.date.toString().substring(11,16)}',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 15,
                      color: const Color(0xfff2f4f3),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    ' م',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 14.5,
                      color: const Color(0xfff2f4f3),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'طلب توصيل رقم'.tr(),
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 14.5,
                            color: const Color(0xff200e32),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          width: 20,
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 3),
                          child: Text(
                            order.id.toString(),
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 14.5,
                              color: const Color(0xff200e32),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),

                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'التوصيل من'.tr(),
                    //       style: TextStyle(
                    //         fontFamily: 'home',
                    //         fontSize: 8,
                    //         color: const Color(0xff200e32),
                    //       ),
                    //       textAlign: TextAlign.start,
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Container(
                    //       child: // Adobe XD layer: 'Travel' (text)
                    //       SizedBox(
                    //         width: 110,
                    //         child:  FutureBuilder<dynamic>(
                    //             future:HelperFunctions.slt.getUserAddress(order.marketLat, order.marketLng),
                    //             builder: (context, snapshot) {
                    //               if (snapshot.hasData) {
                    //                 return   Text(
                    //                   snapshot.data.toString()
                    //                   ,
                    //                   maxLines: 1,
                    //                   overflow: TextOverflow.ellipsis,
                    //                   style: TextStyle(
                    //                     fontFamily: 'home',
                    //                     fontSize: 8,
                    //                     color: const Color(0xff200e32),
                    //                   ),
                    //                   textAlign: TextAlign.start,
                    //                 );
                    //               } else {
                    //                 return SizedBox(height: 5);
                    //               }
                    //             }),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [


                        Container(
                          child: // Adobe XD layer: 'Travel' (text)
                          SizedBox(
                            width: 200,
                            child: FutureBuilder<dynamic>(
                                future:HelperFunctions.slt.getUserAddress(order.userLat, order.userLng),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return   Text(
                                      'التوصيل الى'.tr()+" "+  snapshot.data.toString()
                                      ,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'home',
                                        fontSize: 10,

                                        color: const Color(0xff200e32),
                                      ),
                                      textAlign: TextAlign.start,
                                    );
                                  } else {
                                    return SizedBox(height: 5);
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Container(
            width: 75,
            height: 30,
            child: MaterialButton(
              onPressed: () {

                pushPage(context:context,page: OrderDetail(order.id,KGreenColor,pageStatus: 2,));
              },
              color: Color(0xff707070),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              child: Text(
                'قبول'.tr(),
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 14.5,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}