import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/ui/main_screens/contact_us/ContactUs.dart';
import 'package:matbahk24/ui/user/Account/Account.dart';
import 'package:matbahk24/ui/user/pages/cart/cart_screen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/user/account_transfer/first_page/Accounttransfer.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/add_meal_screen.dart';

import 'package:matbahk24/ui/user/pages/category/category_screen.dart';
import 'package:matbahk24/ui/user/pages/home_user/home_user_screen.dart';
import 'package:matbahk24/ui/user/pages/orders/OrdersScreen.dart';

import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationPage extends StatefulWidget {

  int currentIndex=0 ;


  NavigationPage({this.currentIndex=0});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<Widget> screens = [
    HomeUserScreen(),
    CategoryScreen(),
    OrdersScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.brown,
    )
  ];

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: false,
        bottom: true,

        child: Scaffold(
          key: _key,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: KYellowColor,
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
                            color: Colors.white,
                          ), onPressed: () {
                          pushPage(context:context,page:Account(KYellowColor));

                        },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

          ),
          body: IndexedStack(
            index: widget.currentIndex,
            children: screens,
          ),
          floatingActionButton: getFloatButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: buildBottomAppBar(),
          drawer: MyDrawer(),

        ),
      ),
    );
  }

  Padding getFloatButton() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            if (currentUser.role == "provider") {
              pushPage(context: context, page: AddMealScreen());
            } else {

              pushPage(context: context, page: AccountTransfer());
            }

            // Navigator.of(context).pushNamed(AddMealScreen.id);
          },
          child: GestureDetector(
            onTap: (){
              // String whatsAppUrl = 'mailto:Support@matbakh24.com';
              // UrlLauncher.launch(whatsAppUrl);
              pushPage(context: context,page: ContactUs(KHomeColor));

            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width:5,color:      Color(0xFFF2F4F3),
              )
              ),
              child: Container(
                height: 70,
                width: 70,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 0.2,color: KBluColor)
                ),

                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/applogo.png',height: 50,width: 50,fit: BoxFit.cover,))
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildBottomAppBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(1)),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 25,
            child: MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    widget.currentIndex = 0;
                  });
                },
                child:SvgPicture.asset(
                  "assets/icons/Home.svg",
                  color:widget.currentIndex==0?Colors.green: Colors.green.withOpacity(.5),
                  width: 23,
                  height: 23,
                )),
          ),
          Container(
            width: 25,
            child: MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    widget.currentIndex = 1;
                  });
                },
                child:SvgPicture.asset(
                  "assets/icons/Category.svg",
                  color:widget.currentIndex==1?Colors.green: Colors.green.withOpacity(.4),
                  width: 23,
                  height: 23,
                ))
                    ,
          ),
          Container(
            width: 40,
          ),
          Container(
            width: 25,
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  widget.currentIndex = 2;
                });
              },
              child:
              SvgPicture.asset(
                "assets/icons/Document.svg",
                color:widget.currentIndex==2?Colors.green: Colors.green.withOpacity(.4),
                width: 23,
                height: 23,
              )

            ),
          ),
          Container(
            width: 25,
            child: MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  pushPage(context: context,page: CartScreen());
                },
                child: Icon(Icons.shopping_cart_rounded,size: 30,color: KBluColor,)
            ),
          )
        ],
      ),
    );
  }

}

void showBottomSheetNotifications(context, {color = Colors.white}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext ctx, StateSetter sts) {
            return Container(
                height: MediaQuery.of(context).size.height * .7,
                padding: EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                ),
                decoration: new BoxDecoration(
                    color: color,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0))),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      TitleNotification(),
                      SizedBox(
                        height: 20,
                      ),
                      // Center(
                      //   child:   Text(
                      //     "لاتوجد لديك أي تنبيهات جديدة",
                      //     style: TextStyle(
                      //       fontFamily: 'home',
                      //       fontSize: 13,
                      //       color: const Color(0x99000000),
                      //       letterSpacing: 0.121875,
                      //       fontWeight: FontWeight.w700,
                      //       height: 1.5384615384615385,
                      //     ),
                      //     textHeightBehavior:
                      //     TextHeightBehavior(applyHeightToFirstAscent: false),
                      //     textAlign: TextAlign.start,
                      //   ),
                      // )
                      ListNotification()
                    ],
                  ),
                ));
          },
        );
      });
}


class ListNotification extends StatelessWidget {
  const ListNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (_, index) {
            return ItemListNotification();
          }),
    );
  }
}

class ItemListNotification extends StatelessWidget {
  const ItemListNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFE2E2E2), borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 90,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "مرحبا",
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 13,
                  color: const Color(0x99000000),
                  letterSpacing: 0.121875,
                  fontWeight: FontWeight.w700,
                  height: 1.5384615384615385,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.start,
              ),

              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                      currentUser.fullName,
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 13,
                      color: const Color(0xffff0000),
                      letterSpacing: 0.121875,
                      fontWeight: FontWeight.w700,
                      height: 1.5384615384615385,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.start,
                  )),
              SizedBox(
                width: 10,
              ),


              Text(
                "",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 13,
                  color: const Color(0x99000000),
                  letterSpacing: 0.121875,
                  fontWeight: FontWeight.w700,
                  height: 1.5384615384615385,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.start,
              ),



            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
           "نتمني لك تجربة جيدة معنا ابدأ بتصفح افضل المطابخ والوجبات التي تفضلها",
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 14.5,
              color: const Color(0x99000000),
              letterSpacing: 0.09375,
              height: 1.2,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}

class TitleNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'التنبيهات'.tr(),
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 25,
            color: const Color(0xff200e32),
            letterSpacing: 0.18750001192092894,
            fontWeight: FontWeight.w700,
            height: 1.72,
          ),
          textHeightBehavior:
          TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.start,
        )
,
        Text(
          ' 0 '+"جديد".tr(),
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 13,
            color: const Color(0xff200e32),
            letterSpacing: 0.09750000619888305,
            fontWeight: FontWeight.w700,
            height: 1.6923076923076923,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
