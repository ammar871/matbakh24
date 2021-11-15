import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/contact_us/ContactUs.dart';
import 'package:matbahk24/ui/main_screens/login_page/componts/form_login.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/providers/privacy.dart';
import 'package:matbahk24/widgets/LoginButton.dart';
import 'package:matbahk24/widgets/load_photo2.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Account extends StatelessWidget {
  final color;

  Account(this.color); // var _auth;
  @override
  Widget build(BuildContext context) {
    // if (_auth==null&&currentUser.fullName == null) {
    //   _auth= Provider.of<Auth>(context);
    //   WidgetsBinding.instance?.addPostFrameCallback((_){
    //     _auth.getUserDetail(context);
    //
    //   });
    //
    // }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "بيانات الحساب".tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w300,
              height: 2.5,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.start,
          ),
          backgroundColor: color,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {
              pop(context);
            },
          ),
        ),
        body:!isRegistered()?LoginButton(): currentUser.fullName != null
            ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    color: Colors.grey.withOpacity(0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                currentUser.profileImage == null
                                    ? Icon(
                                        Icons.account_circle,
                                        size: 70,
                                        color: KGreenColor,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            child: LoadPhoto2(
                                              filesUrl+  currentUser.profileImage, 70)),
                                      ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentUser.fullName,
                                      style: TextStyle(
                                        fontFamily: 'home',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        height: 2.5,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      currentUser.userName
                                          .toString()
                                          .replaceAll('+', ''),
                                      style: TextStyle(
                                        fontFamily: 'home',
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w300,
                                        height: 2.5,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.notifications_none_outlined,
                            //       size: 35,
                            //       color: KHomeColor,
                            //     ),
                            //     SizedBox(
                            //       width: 15,
                            //     ),
                            //     Icon(
                            //       Icons.power_settings_new,
                            //       size: 35,
                            //       color: KHomeColor,
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                  pageRow(
                      Icons.account_balance_wallet_outlined,
                      "رصيد الحساب".tr(),
                      "  ${currentUser.balance.toString()} ${tr("رس")}"),
                  Divider(),
                  // pageRow(Icons.directions_car_outlined, "عدد الطلبات", "13"),
                  // Divider(),
                  GestureDetector(
                    onTap: () {
                      pushPage(context: context, page: Privacy());
                    },
                    child: pageRow(Icons.privacy_tip_outlined,
                        "سياسة الخصوصية والاستخدام".tr(), ""),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      // String whatsAppUrl = currentUser.role == "user"
                      //     ? 'mailto:Support@matbakh24.com'
                      //     : "mailto:Support@matbakh24.com";
                      // UrlLauncher.launch(whatsAppUrl);
                      pushPage(context: context, page: ContactUs(color));
                    },
                    child: pageRow(Icons.email_outlined, "تواصل معنا", ""),
                  ),

                  Divider(),
                  InkWell(
                    onTap: () {
                      if (context.locale == Locale('ar')) {
                        context.locale = Locale('en');
                      } else {
                        context.locale = Locale('ar');
                      }
                      Phoenix.rebirth(context);
                    },
                    child: pageRow(Icons.translate, "تغيير اللغة".tr(), ""),
                  ),

                  Divider(),
                  InkWell(
                    onTap: () {
                      signOut(ctx: context, page: LoginScreen());
                    },
                    child: pageRow(
                        Icons.power_settings_new, "تسجيل الخروج".tr(), ""),
                  ),

                  Divider(),
                ],
              )
            : SizedBox());
  }

  pageRow(icon, key, value) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  key,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                color: KHomeColor,
              ),
            ),
          ],
        ),
      );
}
