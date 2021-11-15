import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';

import 'package:matbahk24/ui/user/pages/best_claint/componts/container_type.dart';


import 'About_to_clients.dart';
import 'header_details_clients.dart';


class BodyDetailsClient extends StatelessWidget {
  Market market;
  BodyDetailsClient(this.market);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderDetailsClients(market),
          Text(
            'التصنيف'.tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 6,
              color: const Color(0xfff2f4f3),
              height: 2.8333333333333335,
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: market.fields.map((e) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: ContainerType(e.name));
            }).toList(),
          ),
          SizedBox(
            height: 40,
          ),
          // Adobe XD layer: '✏️ Page Title' (text)
          AboutToClients(market),
          Container(
            color: Colors.red,
          )
        ],
      )
    );
  }
}













