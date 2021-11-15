import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/Provider/FoodProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/componts/BarAddMeal.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/load_photo2.dart';
import 'package:matbahk24/widgets/textfields.dart';
import 'package:provider/provider.dart';

Map addFoodParams = new Map();

class BodyAddMeal3 extends StatefulWidget {
  @override
  State<BodyAddMeal3> createState() => _BodyAddMeal3State();
}

Function onComplete=(){};
class _BodyAddMeal3State extends State<BodyAddMeal3> {
  var _foodProvider;

  final _formKey = GlobalKey<FormState>();

  List<String> images = [];

  var CardRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    if (_foodProvider == null) {
      _foodProvider = Provider.of<FoodProvider>(context);
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                BarAddMeal(3, 'اضافة وجبة جديدة'.tr()),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'ملاحظات'.tr(),
                              style: TextStyle(
                                fontFamily: 'home',
                                fontSize: 15,
                                color: const Color(0xff200e32),
                                letterSpacing: 0.15000000953674317,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35)),
                          child: Column(
                            children: [
                              TextFields(
                                  lable: "اكتب ملاحظات عن الوجبة".tr(),
                                  maxLines: 5,
                                  horizontalMargin: 0,
                                  onChange: (v) {
                                    addFoodParams['notes'] = v.toString();
                                  },
                                  radius: 27,
                                  height: 150),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
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
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RichTextPikPicture(),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            String image = await HelperFunctions.slt
                                .getImage('food', null,context);
                            images.add(image);
                            setState(() {});
                          },
                          child: DottedBorder(
                            color: Colors.black.withOpacity(.5),
                            strokeWidth: 1.2,
                            radius: Radius.circular(CardRadius),
                            dashPattern: [3, 2],
                            customPath: (size) {
                              return Path()
                                ..moveTo(CardRadius, 0)
                                ..lineTo(size.width - CardRadius, 0)
                                ..arcToPoint(Offset(size.width, CardRadius),
                                    radius: Radius.circular(CardRadius))
                                ..lineTo(size.width, size.height - CardRadius)
                                ..arcToPoint(
                                    Offset(
                                        size.width - CardRadius, size.height),
                                    radius: Radius.circular(CardRadius))
                                ..lineTo(CardRadius, size.height)
                                ..arcToPoint(
                                    Offset(0, size.height - CardRadius),
                                    radius: Radius.circular(CardRadius))
                                ..lineTo(0, CardRadius)
                                ..arcToPoint(Offset(CardRadius, 0),
                                    radius: Radius.circular(CardRadius));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Column(
                                children: [
                                  SvgPicture.asset("assets/icons/addimage.svg"),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  // Adobe XD layer: 'Food' (text)
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      'قم باختيار الصور لرفعها او تصوير صور باستخدام الكاميرا'.tr(),
                                      maxLines: null,
                                      style: TextStyle(
                                        fontFamily: 'home',
                                        fontSize: 14.5,
                                        color: const Color(0xff000000),
                                        height: 1.6,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  // Adobe XD layer: 'Food' (text)
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      'تقبل الصور من الأنواع Jpg png jpeg علي ان لا يتخطي الحجم لاكثر من 500 كيلوبايت للصورة الواحدة'.tr(),
                                      style: TextStyle(
                                        fontFamily: 'home',
                                        fontSize: 8,
                                        color: const Color(0x9c000000),
                                        height: 1.625,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: images.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.infinity,
                            height: 60,
                            margin: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35), color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(35),
                                    child:
                                    LoadPhoto2(filesUrl+images[index],55)

                                ),
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              images[index],
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontFamily: 'home',
                                                fontSize: 14.5,
                                                color: const Color(0xff000000),
                                                height: 2.2,
                                              ),
                                              textHeightBehavior:
                                              TextHeightBehavior(applyHeightToFirstAscent: false),
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          // Text(
                                          //   '155  KB',
                                          //   style: TextStyle(
                                          //     fontFamily: 'home',
                                          //     fontSize: 14.5,
                                          //     color: const Color(0x99000000),
                                          //     height: 2.2,
                                          //   ),
                                          //   textHeightBehavior:
                                          //       TextHeightBehavior(applyHeightToFirstAscent: false),
                                          //   textAlign: TextAlign.left,
                                          // ),
                                        ],
                                      ),
                                    )),
                                GestureDetector(

                                  child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: SvgPicture.asset("assets/icons/close_image.svg")),
                                  onTap: () async {

                                    await  _foodProvider.deletePhoto(context : context,id:images[index]);
                                    images.removeAt(index);
                                    setState(() {

                                    });
                                  },
                                )
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 5, left: 25, right: 25),
                    child: DefaultButton(
                        height: 50,
                        text: "التالى".tr(),
                        onPress: () {
                          addFoodParams['images']=images.join("#");
                          addFoodParams['market_id']=currentUser.market.id.toString();
                          addFoodParams['marketName']=currentUser.market.title.toString();
                          print(images.join("#"));
                          if (_formKey.currentState!.validate())
                            _foodProvider.addFood(
                                context: context, params: addFoodParams,

                            );
                        },
                        color: KHomeColor,
                        colorText: Colors.white)),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}


class RichTextPikPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 15,
              color: const Color(0xff200e32),
              letterSpacing: 0.15000000953674317,
            ),
            children: [
              // TextSpan(
              //   text: 'الصور'.tr(),
              //   style: TextStyle(
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              TextSpan(
                text: ' - حتي 5 صور'.tr(),
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 0.08250000524520874,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
