import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/widgets/LoginButton.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/draw/my_drawer.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';
import 'componts/body_cart.dart';

class CartScreen extends StatefulWidget {
  static String id = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {




    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          backgroundColor: KYellowColor,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichTextTitle(Colors.white),
            ],
          ),
        ),
        backgroundColor: Color(0xffF2F4F3),
        body:isRegistered()? BodyCart():  LoginButton()
      ),
    );
  }
}
