import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/account_transfer/second_page/componts/body_second_page.dart';
import 'package:matbahk24/ui/user/account_transfer/second_page/second_page.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/FormAddMeal1.dart';
import 'package:matbahk24/widgets/custom_text_field.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/textfields.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import 'FieldUploadFills.dart';
class FieldsWidget extends StatefulWidget {
  @override
  State<FieldsWidget> createState() => _FieldsWidgetState();
}

class _FieldsWidgetState extends State<FieldsWidget> {


  String fieldsIds = "";

  final _formKey = GlobalKey<FormState>();

  String profileImage = "";

  String bannarImage = "";

  String title = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'انت الان علي وشك تقديم طلب لادارة التطبيق لكي تكون مقدم للخدمة كما الحال لكل مقدمي الخدمة. هذا الطلب سيرسل لادارة التطبيق ليقومو بدورهم بالتدقيق في الطلب و  التأكد من استيفاء الشروط اللازمه ومن ثم ياتيك اشعار بالموافقة او عدم الموافقة. قد يستغرق الطلب حتي 73 ساعه . يتعين عليك ملئ الطلب التالي'.tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 14.5,
                color: const Color(0x99000000),
                height: 2.2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'بعد قبول حسابك ! تقوم الإدارة بمراجعة كل طبخة تقوم بتسجيلها علي النظام قبل نشرها للتاكد من مطابقتها للمواصفات'.tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 14.5,
                color: const Color(0xffff0000),
                fontWeight: FontWeight.w700,
                height: 2.2,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 10,
            ),
            TextFields(
              lable: "اسم المطبخ".tr(),
              horizontalMargin: 0,
              onChange: (v){
                title=v.toString();
              },
              height: 55,
            ),

            SizedBox(
              height: 10,
            ),
            FieldUploadFills(
              text: "صورة الحساب".tr(),
              image: profileImage ?? "",
              isFound: true,
              onPress: () async {
                profileImage = await HelperFunctions.slt.getImage("user", currentUser.id,context);
                setState(()  {
               });
              },
            ),
            SizedBox(
              height: 10,
            ),
            FieldUploadFills(
              text: "صورة البروفايل الترويجية".tr(),
              isFound: true,
              onPress: () async {
                bannarImage = await HelperFunctions.slt.getImage("user", currentUser.id,context);

                setState(()  {
                });
              }, image: bannarImage ?? "",
            ),
            SizedBox(
              height: 10,
            ),
            TextFields(
              lable: "رقم الايبان الخاص بك".tr(),
              horizontalMargin: 0,
              height: 55,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "نوع الطبخات التي تقدمها - اختر اكثر من واحدة".tr(),
                      style: TextStyle(
                        fontSize: 11,color: Colors.black
                      ),
                    ),
                  ),

                  MultiSelectChipField<Field?>(
                    items: fields
                        .map((f) => MultiSelectItem<Field>(f, f.name))
                        .toList(),
                       textStyle: TextStyle(
                         color: Colors.black
                       ),
                       selectedTextStyle: TextStyle(
                           color: Colors.white
                       ),
                       decoration: BoxDecoration(
                         color: Colors.transparent,
                         
                         borderRadius: BorderRadius.circular(20),
                       ),
                       selectedChipColor: KGreenColor.withOpacity(0.9),
                    headerColor: Colors.white,
                    showHeader: false,
                    onTap: (values) {
                      fieldsIds = values.map((e) => e?.id).toList().join('#');
                      print(fieldsIds);
                    },
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 15,
            ),
            DefaultButton(
                height: 55,
                text: "التالى".tr(),
                onPress: () {
                 addMarketParams= {
                    "title":title,
                    'user_id':currentUser.id,
                    'image':profileImage,
                    'bannarImage':bannarImage,
                    'lat':locData.latitude.toString(),
                    'lng':locData.longitude.toString(),
                     'phone':'05374823643753',
                    'fields':fieldsIds
                  };
                 print(addMarketParams);
                 if(_formKey.currentState!.validate()){
                   if(profileImage == ""){
                     HelperFunctions.slt.notifyUser(context: context,message: "اختر صورة الحساب".tr());
                     return;
                   }
                   if(bannarImage == ""){
                     HelperFunctions.slt.notifyUser(context: context,message: "اختر صورة البروفايل الترويجية".tr());
                     return;
                   }
                   pushPage(context:context,page:SecondPage());

                 }

                },
                color: KHomeColor,
                colorText: Colors.white),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  String? checkFieldEmpty(String? fieldContent) {
    //<-- add String? as a return type
    if (fieldContent!.isEmpty) {
      return 'Ce champ est obligatoire.';
    }
    return null;
  }
}
