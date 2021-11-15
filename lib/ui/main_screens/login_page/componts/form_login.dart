import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/complete_accounte_screen/complete_accounte_screen.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/main_screens/sign_up/sign_up_screen.dart';
import 'package:matbahk24/ui/main_screens/validate_number/validte_number_screen.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/custom_suffixicon.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:provider/provider.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

late String userName;
var authProvider;

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (authProvider == null) {
      authProvider = Provider.of<Auth>(context);
    }
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              buildTextFieldPhone(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                colorText: Color(0xffffffff),
                height: 50,
                text: "دخول".tr(),
                onPress: () {
                  if (userName.trim().length == 13) {
                    authProvider.checkUser(
                        phone: userName,
                        context: context,
                        onComplete: _onComplete);
                  } else {
                    HelperFunctions.slt.notifyUser(
                        context: context,
                        message: "اكتب رقم الهاتف".tr(),
                        color: Colors.black45);
                  }
                },
                color: KHomeColor,
              ),
              TextButton(
                  onPressed: () {
                    replacePage(context: context, page: NavigationPage());
                  },
                  child: Text(
                    "تخطي",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  _onComplete(status, userCode) {
    featchedCode = userCode;
    if (status == 1) {
      pushPage(
          context: context,
          page: ValidateNumberScreen(
            username: userName,
            code: userCode,
          ));
    } else {
      pushPage(context: context, page: CompleteAccountScreen());
    }
  }

  TextFormField buildTextFieldPhone() => TextFormField(
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.deny(
            RegExp("[٠-٩]"),
          ),
        ],
        maxLength: 9,
        onChanged: (value) {
          userName = "+966" + value.toString();
        },
        validator: (value) {
          return null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: "home", fontSize: 15, color: KTextColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "رقم الهاتف بدون مفتاح".tr(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      );
}
