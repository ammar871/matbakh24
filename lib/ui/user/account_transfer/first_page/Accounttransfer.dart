import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

import 'componts/BodyFirstPage.dart';
class AccountTransfer extends StatelessWidget {
  static String id = "/FirstPage";
  @override
  Widget build(BuildContext context) {
    if(locData.latitude==null){
      getLocation();
    }
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();

      },
      child: Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () {
          //     pop(context);
          //   },
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: KBluColor,
          //   ),
          // ),
          backgroundColor: KYellowColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichTextTitle(Color(0xff000000)),
              InkWell(
                onTap: () {
                  signOut(ctx: context, page: LoginScreen());
                },
                child:  Icon(Icons.power_settings_new,),)
            ],
          ),

        ),
        backgroundColor: Color(0xffF2F4F3),
        body: BodyFirstPage(),
      ),
    );
  }
}
