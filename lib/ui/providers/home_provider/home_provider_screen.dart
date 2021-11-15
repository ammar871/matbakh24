
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/provider_account_detail/provider_account_screen.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';
import '../provider_drawer.dart';
import 'componts/BodyHomeMandop.dart';
class HomeProviderScreen extends StatelessWidget {
  static String id = "/HomeProviderScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichTextTitle(Colors.black),
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
                  //     padding: EdgeInsets.all(0),
                  //     onPressed: (){
                  //       showBottomSheetNotifications(context);
                  //
                  //     },
                  //     icon: Icon(
                  //       Icons.notifications,
                  //       size: 25,
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    left: 20,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.account_circle,
                        size: 30,
                      ), onPressed: () {
                        pushPage(context:context,page:ProviderAccountScreen(currentUser.market));
                    },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: BodyHomeProvider(),
      drawer: ProviderDrawer(),
    );
  }
}
