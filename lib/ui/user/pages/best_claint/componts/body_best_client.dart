import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/title_text1.dart';
import 'package:matbahk24/ui/user/pages/home_user/componts/title_bar_home.dart';

import 'list_best_clients.dart';
import 'list_lasted_clients.dart';

class BodyBestClient extends StatelessWidget {
  List<Market> markets;

  BodyBestClient(this.markets);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarHomeUser(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                TitleText1("افضل المطاعم".tr()),
                SizedBox(
                  height: 10,
                ),
                ListBestClients(markets),
                SizedBox(
                  height: 10,
                ),
                TitleText1("تصفح مقدمي الوصفات".tr()),
                SizedBox(
                  height: 10,
                ),
                ListLastedClients(markets)
              ],
            ),
          )
        ],
      ),
    );
  }
}
