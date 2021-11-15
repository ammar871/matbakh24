import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';

import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/login_page/componts/form_login.dart';
import 'package:matbahk24/ui/providers/privacy.dart';
import 'package:matbahk24/ui/user/account_transfer/first_page/componts/FieldsWidget.dart';
import 'package:matbahk24/ui/user/account_transfer/success_transfer/success_transfer.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/FormAddMeal1.dart';
import 'package:matbahk24/widgets/custom_text_field.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/textfields.dart';
import 'package:provider/provider.dart';

import '../../BarAccountTransfer.dart';

var addMarketParams;
class BodySecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarAccountTransfer(),
          SizedBox(
            height: 20,
          ),
          FormField()
        ],
      ),
    );
  }
}

class FormField extends StatefulWidget {
  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  final TextEditingController controller = TextEditingController();



  late final String currentValue;
  bool isAccept = false;
    late bool selected=false;
  final _formKey = GlobalKey<FormState>();
  var _authProvider;
  @override
  Widget build(BuildContext context) {
    if(_authProvider==null){
      _authProvider=Provider.of<Auth>(context);
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFields(
                lable: "وصف مختصر عنك وعن مايمكن ان تقدمه".tr(),
                maxLines: 5,
                horizontalMargin: 0,
                onChange: (v){
                  addMarketParams['summary']= v.toString();
                },
                radius: 27,
                height: 200),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '200 كلمة متاح'.tr(),
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14.5,
                    color: const Color(0xff000000),
                    height: 2.2,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'هل تقدم خدمة البوفيه'.tr(),
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14.5,
                    color: const Color(0xff000000),
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    setState(() {
                      selected=!selected;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      color: selected ? KHomeColor : Color(0xffe2e2e2),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),
            DefaultButton(
                height: 55,
                text: "التالى".tr(),
                onPress: () {
                  if(_formKey.currentState!.validate()){
                    _authProvider.registerMarket(context:context,params:addMarketParams);
                  }
                },
                color: KHomeColor,
                colorText: Colors.white),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: (){
                    pushPage(context: context, page: Privacy());

                  },
                  child: Text(
                    'أوافق علي تعليمات و قواعد المنصة'.tr(),
                    style: TextStyle(
                      fontFamily: 'home2',
                      fontSize: 14,
                      color: KHomeColor,
                      letterSpacing: 0.5,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isAccept = !isAccept;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      color: isAccept ? KHomeColor : Color(0xffe2e2e2),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
