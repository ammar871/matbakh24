
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Provider/MarketProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/body_best_client.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/list_lasted_clients.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/title_text1.dart';
import 'package:matbahk24/ui/user/pages/home_user/componts/title_bar_home.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {

   var _marketProvider;
   String search="#";
  @override
  Widget build(BuildContext context) {
    if(_marketProvider==null){
      _marketProvider= Provider.of<MarketProvider>(context);


    }
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F3),
      appBar:  AppBar(
        leading: IconButton(
          onPressed: (){
            pop(context);
          },
          icon: Icon(
            Icons.arrow_back,color: KBluColor,
          ),
        ),
        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichTextTitle(Color(0xff000000)),
          ],
        ),
      ),
      body: ListView(
        children: [
      MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: (){
        pushPage(context:context,page:SearchScreen());
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
        decoration: BoxDecoration(
            color: KYellowColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:20,
                    ),
                    Icon(Icons.search, color: const Color(0xffb7bec6)),
                    SizedBox(
                      width:20,
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          hintText:'اكتب اسم المقدم الذي تبحث عنه'.tr(),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,

                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintStyle: TextStyle(fontSize: 12),
                        ),
                        onChanged: (v){
                          _marketProvider.searchMarkets(context:context,text:v.toString());
                        },
                      ),
                    ),

                    SizedBox(
                      width: 10,
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مقدمي خدمة في منطقتي و مناطق قريبة'.tr(),
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14,

                    color: const Color(0xff200e32),
                    height: 2,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 20,
                ),
                StylesWidget.getSvg("assets/icons/pin.svg", 15, 15)
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ),

        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(children: [
            TitleText1("تصفح مقدمي الوصفات".tr()),
            SizedBox(
              height: 10,
            ),
            ListLastedClients(_marketProvider.markets)
          ],),
        )
        ],
      )
    );
  }
}
