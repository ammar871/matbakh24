import 'dart:async';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';

import 'package:matbahk24/ui/main_screens/complete_accounte_screen/complete_accounte_screen.dart';
import 'package:matbahk24/ui/main_screens/login_page/componts/form_login.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {


  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";
  var errorController;
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();


  @override
  initState()   {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();

      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              width: 200,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v.toString().length < 3) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                  //             decoration: BoxDecoration(
                  //                 color: Color(0xFFE2E2E2),
                  //                 borderRadius: BorderRadius.circular(9.0)),
                  //             width: 35,
                  //             height: 50,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(9),
                    fieldHeight: 50,
                    fieldWidth: 35,
                    inactiveColor:  Color(0xFFE2E2E2),
                    inactiveFillColor:Color(0xFFE2E2E2),
                    borderWidth: 1,

                    selectedFillColor: Color(0xFFE2E2E2),

                    activeFillColor:
                    Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,

                  onCompleted: (v) {
                    print("Completed");
                  },

                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 50),
              child: DefaultButton(
                colorText: Color(0xffffffff),
                height: 50,
                text: "تحقق".tr(),
                onPress: () {
                    authProvider.login(context: context,code: currentText,phone: userName,onFaild: (){
                      HelperFunctions.slt.notifyUser(context: context,message: "كود التفعيل الذي أدخلته غير صحيح",color: Colors.red);
                    });
                },
                color: KHomeColor,
              ),
            )
          ],
        ),
      ),
    );




  }
}
