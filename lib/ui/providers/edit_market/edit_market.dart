import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/Provider/FieldProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/login_page/componts/form_login.dart';
import 'package:matbahk24/ui/user/account_transfer/first_page/componts/FieldUploadFills.dart';
import 'package:matbahk24/ui/user/account_transfer/second_page/componts/body_second_page.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/textfields.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class EditMarket extends StatefulWidget {
  Market market;
  EditMarket(this.market);
  @override
  _EditMarketState createState() => _EditMarketState();
}
class _EditMarketState extends State<EditMarket> {
  String fieldsIds = "";
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    fieldsIds =
        widget.market.fields.map((e) => e.id).toList().join('#');
  }
  var _authProvider;
  @override
  Widget build(BuildContext context) {
    if(_authProvider==null){
      _authProvider=Provider.of<Auth>(context);
    }
    return Scaffold(
      backgroundColor: Color(0xffF2F4F3),
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: KYellowColor,
          title: Text(
            "تعديل الحساب",
            style: TextStyle(
                fontFamily: 'home3',
                fontSize: 23,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          )),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFields(
                  lable: "اسم المطبخ".tr(),
                  horizontalMargin: 0,
                  initialValue: widget.market.title,
                  onChange: (v) {
                    widget.market.title = v.toString();
                  },
                  height: 55,
                ),
                SizedBox(
                  height: 10,
                ),
                FieldUploadFills(
                  text: "صورة الحساب".tr(),
                  image:  widget.market.image,
                  isFound: true,
                  onPress: () async {
                    widget.market.image = await HelperFunctions.slt
                        .getImage("user", currentUser.id,context);
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FieldUploadFills(
                  text: "صورة البروفايل الترويجية".tr(),
                  isFound: true,
                  onPress: () async {
                    widget.market.bannarImage = await HelperFunctions.slt
                        .getImage("user", currentUser.id,context);
                    setState(() {});
                  },
                  image:  widget.market.bannarImage,
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
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        ),
                      ),
                      MultiSelectChipField<Field?>(
                        items: fields
                            .map((f) => MultiSelectItem<Field>(f, f.name))
                            .toList(),
                        textStyle: TextStyle(color: Colors.black),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        selectedChipColor: KGreenColor.withOpacity(0.9),
                        headerColor: Colors.white,

                        showHeader: false,
                        onTap: (values) {
                          fieldsIds="";
                          fieldsIds =
                              values.map((e) => e?.id).toList().join('#');
                          print(fieldsIds);
                        },
                      ),
                    ],
                  ),
                ),

                // SizedBox(
                //   height: 15,
                // ),
                // DefaultButton(
                //     height: 55,
                //     text: "التالى".tr(),
                //     onPress: () {
                //       // addMarketParams= {
                //       //   "title":title,
                //       //   'user_id':currentUser.id,
                //       //   'image':profileImage,
                //       //   'bannarImage':bannarImage,
                //       //   'lat':locData.latitude.toString(),
                //       //   'lng':locData.longitude.toString(),
                //       //   'phone':'05374823643753',
                //       //   'fields':fieldsIds
                //       // };
                //       // print(addMarketParams);
                //       // if(_formKey.currentState!.validate()){
                //       //   if(profileImage == ""){
                //       //     HelperFunctions.slt.notifyUser(context: context,message: "اختر صورة الحساب".tr());
                //       //     return;
                //       //   }
                //       //   if(bannarImage == ""){
                //       //     HelperFunctions.slt.notifyUser(context: context,message: "اختر صورة البروفايل الترويجية".tr());
                //       //     return;
                //       //   }
                //       //   pushPage(context:context,page:SecondPage());
                //       //
                //       // }
                //
                //     },
                //     color: KHomeColor,
                //     colorText: Colors.white),
                SizedBox(
                  height: 20,
                ),
                TextFields(
                    lable: "وصف مختصر عنك وعن مايمكن ان تقدمه".tr(),
                    maxLines: 5,
                    horizontalMargin: 0,
                    initialValue: widget.market.summary,
                    onChange: (v) {
                      // addMarketParams['summary']= v.toString();
                    },
                    radius: 27,
                    height: 190),
                SizedBox(
                  height: 25,
                ),
                DefaultButton(
                    height: 55,

                    text: "حفظ".tr(),
                    onPress: () {
                      print(fieldsIds);
                      addMarketParams= {
                        "title":widget.market.title,
                        'user_id':currentUser.id,
                        'image':widget.market.image,
                        'bannarImage':widget.market.bannarImage,
                        'lat':locData.latitude.toString(),
                        'lng':locData.longitude.toString(),
                        'phone':widget.market.phone,
                        'fields':fieldsIds,
                        "summary":widget.market.summary
                      };
                      print(addMarketParams);
                      if(_formKey.currentState!.validate()){
                        _authProvider.updateMarket(context:context,params:addMarketParams);
                      }

                    },
                    color: KYellowColor,
                    colorText: Colors.black),
                SizedBox(height: 40,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
