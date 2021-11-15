import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/driver/home_provider/componts/driver_drawer.dart';
import 'package:matbahk24/ui/providers/home_provider/componts/BodyHomeMandop.dart';
import 'package:matbahk24/ui/providers/provider_drawer.dart';
import 'package:matbahk24/ui/user/Account/Account.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/BodyHomeDriver.dart';


class HomeDriverScreen extends StatelessWidget {
  static String id = "/HomeDriverScreen";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: KGreenColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichTextTitle(Colors.white),
            Container(
              width: 100,
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    top: 9,
                    right: 0,
                    child: Text(
                      '',
                      style: TextStyle(
                        fontFamily: 'mons',
                        fontSize: 12,
                        color: const Color(0xffff0000),
                        fontWeight: FontWeight.w700,
                        height: 1.0833333333333333,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Positioned(
                  //   left: 60,
                  //   top: 0,
                  //   bottom: 0,
                  //   child: IconButton(
                  //     padding: EdgeInsets.all(1),
                  //     icon: Icon(
                  //       Icons.notifications,
                  //       size: 24,
                  //     ), onPressed: () {
                  //     showBottomSheetNotifications(context,color: KGreenColor);
                  //
                  //   },
                  //   ),
                  // ),
                  Positioned(
                    left: 20,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      padding: EdgeInsets.all(1),

                      icon: Icon(
                        Icons.account_circle,
                        size: 30,
                      ), onPressed: () {
                        pushPage(context: context,page: Account(KGreenColor));

                    },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: BodyHomeDriver(),
      drawer: DriverDrawer(),
    );
  }
}
