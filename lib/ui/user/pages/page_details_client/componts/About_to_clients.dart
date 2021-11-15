import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';
import 'list_products_clients.dart';

class AboutToClients extends StatelessWidget {
  Market market;

  AboutToClients(this.market);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      /*    Align(
            alignment: AlignmentDirectional.centerStart,
            child:   Text(
              'نبذة'.tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 15,
                color: const Color(0xffffd700),
                letterSpacing: 0.11250000715255737,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
          ),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child:            Text(
                market.summary,
                textAlign: TextAlign.start,
                maxLines: 5,
                style:  TextStyle(
                  fontFamily: 'home',
                  fontSize: 13,
                  color: Colors.white,
                  letterSpacing: 0.11250000715255737,
                  fontWeight: FontWeight.w700,
                )
            ),

          ),
*/
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'الطبخات المعروضة للطلب'.tr(),
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 15,
                  color: const Color(0xffffd700),
                  letterSpacing: 0.11250000715255737,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ListProductsOfClints(market),
        ],
      ),
    );
  }
}