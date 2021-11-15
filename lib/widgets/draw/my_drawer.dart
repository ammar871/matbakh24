import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/main_screens/contact_us/ContactUs.dart';
import 'package:matbahk24/ui/providers/home_provider/home_provider_screen.dart';
import 'package:matbahk24/ui/user/Account/Account.dart';
import 'package:matbahk24/ui/user/UserAddress/MapScreen.dart';
import 'package:matbahk24/ui/user/UserAddress/UserAddresses.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/ui/user/pages/cart/cart_screen.dart';
import 'package:matbahk24/ui/user/pages/category/category_screen.dart';
import 'package:share/share.dart';

import '../rich_title_text.dart';
import 'clipper_path.dart';
import 'item_draw.dart';

class MyDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
      canvasColor: Colors.white//This will change the drawer background to blue.
      //other styles
    ),
      child: Drawer(
        
        

        child: Container(
          decoration: BoxDecoration(

            //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),

            shrinkWrap: true,
            children: [
              SizedBox(
                height: 80,
              ),
              RichTextTitle(Colors.white),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ItemDraw(
                      icon: "home_draw.svg",
                      text: "الرئيسية".tr(),
                      press: () {
                        replacePage(context: context,page: NavigationPage(currentIndex: 0,));
                      },
                      color: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  ItemDraw(
                      icon: "category_draw.svg",
                      text: "الفئات".tr(),
                      press: () {
                        replacePage(context: context,page: NavigationPage(currentIndex: 1,));
                      },
                      color: Colors.green),
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
                  SizedBox(
                    height: 10,
                  ),
                  ItemDraw(
                      icon: "order.svg",
                      text: "الطلبات".tr(),
                      press: () {
                        replacePage(context: context,page: NavigationPage(currentIndex: 2,));
                      },
                      color: Colors.green),
                  SizedBox(
                    height: 10,
                  ),

                  InkWell(
                    onTap: () {
                      // String whatsAppUrl = currentUser.role == "user"
                      //     ? 'mailto:Support@matbakh24.com'
                      //     : "mailto:Support@matbakh24.com";
                      // UrlLauncher.launch(whatsAppUrl);
                      pushPage(context: context,page: CartScreen());

                    },
                    child: pageRow(Icons.shopping_cart_sharp, "سلة الطلبات", ""),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ItemDraw(
                      icon: "Location.svg",
                      text: "عناويني".tr(),
                      press: () {
                        pushPage(context: context,page: UserAdresses());
                      },
                      color: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  ItemDraw(
                    icon: "Profile.svg",
                    text: "بيانات الحساب".tr(),
                    press: () {
                      pushPage(context: context,page: Account(KYellowColor));
                    },
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(color: Colors.green,),
                  SizedBox(
                    height: 10,
                  ),
               // if(currentUser.market!=null)   InkWell(
               //      onTap: (){
               //        pushPage(context: context,page: HomeProviderScreen());
               //      },
               //      child: Row(
               //        children: [
               //          Container(
               //            height: 12,
               //            width: 12,
               //            decoration: BoxDecoration(
               //              shape: BoxShape.circle,
               //              color: Color(0xff7cac21),
               //            ),
               //          ),
               //          Padding(
               //            padding: const EdgeInsets.all(10.0),
               //            child: Text(
               //              "مطبخي",
               //              style: TextStyle(
               //                  fontFamily: 'home3',
               //                  fontSize: 20,
               //                  color: KYellowColor,
               //                  fontWeight: FontWeight.bold),
               //
               //            ),
               //          ),
               //        ],
               //      ),
               //    ),



                  InkWell(
                    onTap: () {
                      // String whatsAppUrl = currentUser.role == "user"
                      //     ? 'mailto:Support@matbakh24.com'
                      //     : "mailto:Support@matbakh24.com";
                      // UrlLauncher.launch(whatsAppUrl);
                      pushPage(context: context,page: ContactUs(KHomeColor));

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
              ),
             isRegistered()? ItemDraw(
                icon: "logout.svg",
                text: "تسجيل الخروج".tr(),
                press: () {
                  signOut(ctx: context);
                },
                color: Color(0xffffdd2c),
              ):ItemDraw(
               icon: "logout.svg",
               text: "تسجيل الدخول".tr(),
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
              color:KYellowColor,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              key,
              style: TextStyle(
                fontSize: 18,
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