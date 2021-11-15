import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/contact_us/ContactUs.dart';
import 'package:matbahk24/ui/user/Account/Account.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/draw/item_draw.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';
import 'package:share/share.dart';

import '../home_driver_screen.dart';


class DriverDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: 300.0,
        decoration: BoxDecoration(
          color: KGreenColor,
          //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              RichTextTitle(Colors.white),

              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      ItemDraw(
                          icon: "home_draw.svg",
                          text: "الرئيسية".tr(),
                          press: () {
                            replacePage(context: context,page: HomeDriverScreen());
                          },
                          color: Colors.white),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      // ItemDraw(
                      //     icon: "fav.svg",
                      //     text: "المفضلة",
                      //     press: () {},
                      //     color: Colors.white),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ItemDraw(
                      //     icon: "Notification_draw.svg",
                      //     text: "التنبيهات".tr(),
                      //     press: () {
                      //       pop(context);
                      //       showBottomSheetNotifications(context);
                      //     },
                      //     color: Colors.white),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ItemDraw(
                      //     icon: "Wallet.svg",
                      //     text: "محفظتي",
                      //     press: () {},
                      //     color: Colors.white),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ItemDraw(
                      //     icon: "order.svg",
                      //     text: "الطلبات".tr(),
                      //     press: () {
                      //       replacePage(context: context,page: NavigationPage(currentIndex: 2,));
                      //     },
                      //     color: Colors.white),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ItemDraw(
                      //     icon: "Location.svg",
                      //     text: "عناويني".tr(),
                      //     press: () {
                      //       pushPage(context: context,page: UserAdresses());
                      //     },
                      //     color: Colors.white),
                      SizedBox(
                        height: 10,
                      ),
                      ItemDraw(
                        icon: "Profile.svg",
                        text: "بيانات الحساب".tr(),
                        press: () {
                          pushPage(context: context,page: Account(KGreenColor));
                        },
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(color: Colors.white,),
                      SizedBox(
                        height: 10,
                      ),
                      // if(currentUser.market!=null)   InkWell(
                      //   onTap: (){
                      //     // pushPage(context: context,page: HomeProviderScreen());
                      //   },
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 12,
                      //         width: 12,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: Color(0xff7cac21),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: Text(
                      //           "مطبخي",
                      //           style: TextStyle(
                      //               fontFamily: 'home3',
                      //               fontSize: 20,
                      //               color: KYellowColor,
                      //               fontWeight: FontWeight.bold),
                      //
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {
                          // String whatsAppUrl = currentUser.role == "user"
                          //     ? 'mailto:Support@matbakh24.com'
                          //     : "mailto:Support@matbakh24.com";
                          // UrlLauncher.launch(whatsAppUrl);
                          pushPage(context: context,page: ContactUs(KGreenColor));

                        },
                        child: pageRow(Icons.email_outlined, "تواصل معنا", ""),
                      ),

                      InkWell(
                        onTap: () {
                          Share.share('https://testflight.apple.com/join/p8gKHGap');


                        },
                        child: pageRow(Icons.share, "شارك التطبيق", ""),
                      ),
                    ],
                  )),
              ItemDraw(
                icon: "logout.svg",
                text: "تسجيل الخروج".tr(),
                press: () {
                  signOut(ctx: context);
                },
                color: Color(0xffffdd2c),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
  pageRow(icon, key, value) => Container(
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              key,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: KHomeColor,
          ),
        ),
      ],
    ),
  );

}