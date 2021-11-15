import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/Model/User.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/login_page/componts/form_login.dart';
import 'package:matbahk24/ui/providers/privacy.dart';
import 'package:matbahk24/ui/user/account_transfer/first_page/componts/FieldUploadFills.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/textfields.dart';
import 'package:provider/provider.dart';

class FormCompleted extends StatefulWidget {
  @override
  _FormCompletedState createState() => _FormCompletedState();
}

class _FormCompletedState extends State<FormCompleted> {
  final _formKey = GlobalKey<FormState>();

  User user = User();
  late int accountType = 1;
  late bool isAccept = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),


            TextFields(
              horizontalMargin: 10,
              lable: 'الإسم بالكامل'.tr(),
              keyboard: TextInputType.text,

              onChange: (v) {
                user.fullName = v.toString();
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFields(
                horizontalMargin: 10,

                lable: "البريد الإلكتروني".tr(),
                onChange: (v) {
                  user.email = v.toString();
                }),
            SizedBox(
              height: 10,
            ),
            if (accountType == 3||accountType == 2)
              Column(
                children: [
                  TextFields(
                    horizontalMargin: 10,
                    initialValue: "",
                    lable: "رقم الهوية".tr(),
                    onChange: (v) {
                      user.identityNumber = v.toString();
                    },
                    keyboard: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFields(
                    horizontalMargin: 10,
                    initialValue: "",
                    lable: "رقم الأيبان".tr(),
                    onChange: (v) {
                      user.ibanNumber = v.toString();
                    },
                    keyboard: TextInputType.text,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                    child: FieldUploadFills(
                      text: "صورة شخصية واضحة".tr()+(accountType == 2?" ( اختياري )":""),
                      isFound: true,
                      onPress: () async {
                       user.profileImage = await HelperFunctions.slt
                            .getImage("user", currentUser.id,context);
                        setState(() {});
                      },
                      image: user.profileImage!=null? user.profileImage:"",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                    child: FieldUploadFills(
                      text: "صورة الهوية".tr()+(accountType == 2?" ( اختياري )":""),
                      isFound: true,
                      onPress: () async {
                        user.identityImage = await HelperFunctions.slt
                            .getImage("user", currentUser.id,context);
                        setState(() {});
                      },
                      image:  user.identityImage!=null? user.identityImage:"",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (accountType == 3)   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                    child: FieldUploadFills(

                      text: "صورة واضحة للسيارة".tr(),
                      isFound: true,
                      onPress: () async {
                        user.carImage = await HelperFunctions.slt
                            .getImage("user", currentUser.id,context);
                        setState(() {});
                      },
                      image:  user.carImage!=null? user.carImage:"",
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20,),
            Text(
              'نوع الحساب'.tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 16,
                color: const Color(0xFF878787),
                letterSpacing: 0.8,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  accountType = 1;
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  color: accountType == 1 ? KGreenColor : Color(0x00000000),
                  border:
                      Border.all(width: 1.0, color: const Color(0x1f000000)),
                ),
                child: Center(
                  child: // Adobe XD layer: '✏️ Label' (text)
                      Text(
                    'مستخدم'.tr(),
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 14,
                      color:
                          accountType == 1 ? Colors.white : Color(0x6f000000),
                      letterSpacing: 0.252,
                      height: 1.4285714285714286,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        accountType = 2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        color:
                            accountType == 2 ? KGreenColor : Color(0x00000000),
                        border: Border.all(
                            width: 1.0, color: const Color(0x1f000000)),
                      ),
                      child: Center(
                        child: // Adobe XD layer: '✏️ Label' (text)
                            Text(
                          'مقدم خدمة'.tr(),
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 14,
                            color: accountType == 2
                                ? Colors.white
                                : Color(0x6f000000),
                            letterSpacing: 0.252,
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        accountType = 3;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        color:
                            accountType == 3 ? KGreenColor : Color(0x00000000),
                        border: Border.all(
                            width: 1.0, color: const Color(0x1f000000)),
                      ),
                      child: Center(
                        child: // Adobe XD layer: '✏️ Label' (text)
                            Text(
                          'مندوب توصيل'.tr(),
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 14,
                            color: accountType == 3
                                ? Colors.white
                                : Color(0x6f000000),
                            letterSpacing: 0.252,
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DefaultButton(
              colorText: Color(0xffffffff),
              height: 50,
              text: "التالى".tr(),
              onPress: () {
                user.userName = userName;
                print(user.userName);
                if (_formKey.currentState!.validate()) {

                  if(accountType==3&&(user.identityImage==null||user.profileImage==null)){
                    HelperFunctions.slt.notifyUser(
                        context: context,
                        message: "يجب تقديم صورة شخصية و صورة شخصية حتي يتم قبول حسابك ",
                        color: KHomeColor);
                  }
                  if (isAccept) {
                    if(user.email.toString().length>6&&user.email.toString().contains("@")){
                      authProvider.validate(
                          userToValidate: user,
                          context: context,
                          type: accountType);
                    }else{
                      HelperFunctions.slt.notifyUser(
                          context: context,
                          message: "البريد الإلكتروني غير صحيح",
                          color: KHomeColor);
                    }

                  } else {
                    HelperFunctions.slt.notifyUser(
                        context: context,
                        message: "يجب الموافقة علي بنود المنصة".tr(),
                        color: KHomeColor);
                  }
                }
              },
              color: KHomeColor,
            ),
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
                      decoration: TextDecoration.underline,
                      color: KHomeColor,
                      letterSpacing: 0.5,
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
        ));
  }
}
