import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';

class DailogCurrentOrder extends StatelessWidget {
  static String id = "/DailogCurrentOrder";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 650,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: Colors.white),
        child: Container(
          child: Column(
            children: [
              Text(
                'طلب توصيل قيد الانتظار'.tr(),
                style: TextStyle(
                  fontFamily: 'home',
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: const Color(0xff200e32),
                  letterSpacing: 0.15000000953674317,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '25339',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'home',
                  fontSize: 37,
                  color: const Color(0xfff5833c),
                  letterSpacing: 0.27750001764297483,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xff707070)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DetaisOrderText(
                      text2: 'منيره الهدلق',
                      text1: 'مقدم الطلب'.tr(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.copy,
                          size: 15,
                        ),
                        Expanded(
                            child: // Adobe XD layer: 'Travel' (text)
                                Text(
                          'G5CJ+CR Al Sharafeyah, Jeddah Saudi Arabia',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'home',
                            fontSize: 8,
                            color: const Color(0xff200e32),
                          ),
                          textAlign: TextAlign.start,
                        )),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'العنوان'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'home',
                            fontSize: 14.5,
                            color: const Color(0xff200e32),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DetaisOrderText(
                      text2: '  6   كم   8  دقيقة',
                      text1: 'المسافة  '.tr(),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xff707070)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    DetaisOrderText(
                      text2: 'منيره الهدلق',
                      text1: 'مقدم الطلب'.tr(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.copy,
                          size: 15,
                        ),
                        Expanded(
                            child: // Adobe XD layer: 'Travel' (text)
                                Text(
                          'G5CJ+CR Al Sharafeyah, Jeddah Saudi Arabia',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'home',
                            fontSize: 8,
                            color: const Color(0xff200e32),
                          ),
                          textAlign: TextAlign.start,
                        )),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'العنوان'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'home',
                            fontSize: 14.5,
                            color: const Color(0xff200e32),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DetaisOrderText(
                      text2: '  6   كم   8  دقيقة',
                      text1: 'المسافة  '.tr(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xff707070)))),
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Adobe XD layer: 'Travel' (text)
                    Expanded(
                      child: Text(
                        'وجبة بريا دجاج عدد 5 افراد مع مرفقات دقوس ومرق و 4 لبن خاثر. الطلب عباره عن 7 اكياس '.tr(),
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'home',
                          fontSize: 8,
                          color: const Color(0xff200e32),
                          height: 1.875,
                        ),
                        maxLines: 2,
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      'تفاصيل الطلب'.tr(),
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'home',
                        fontSize: 14.5,
                        color: const Color(0xff200e32),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RowTotal(),
              SizedBox(
                height: 15,
              ),
              ButtonsCurrentOrder()
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonsCurrentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(width: 1, color: KHomeColor)),
          child: MaterialButton(
            onPressed: () {},
            height: 60,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            child: Text(
              'تجاهل',
              style: TextStyle(
                fontFamily: 'home3',
                fontSize: 14.5,
                color: KHomeColor,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: MaterialButton(
          onPressed: () {
            // Navigator.of(context).pushNamed(TrakingMandop.id);
          },
          height: 60,
          color: KHomeColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: Text(
            'قبول',
            style: TextStyle(
              fontFamily: 'home3',
              fontSize: 14.5,
              color: const Color(0xffffffff),
              letterSpacing: 0.5,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        )),
      ],
    );
  }
}

class RowTotal extends StatelessWidget {
  const RowTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TotalTextOrder(
          text1: 'الاجمالي',
          text2: "40",
        ),
        TotalTextOrder(
          text1: 'سعر الكيلومتر',
          text2: "2",
        ),
        TotalTextOrder(
          text1: 'اجمالي المسافة',
          text2: "20",
        )
      ],
    );
  }
}

class TotalTextOrder extends StatelessWidget {
  final String text1, text2;

  TotalTextOrder({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        // Adobe XD layer: 'Travel' (text)
        Text(
          text1,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'home',
            fontSize: 14.5,
            color: const Color(0xff989898),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.start,
        ),

        // Adobe XD layer: 'Travel' (text)
        Text(
          text2,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'home',
            fontSize: 35,
            color: const Color(0xff200e32),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.start,
        )
      ],
    ));
  }
}

class DetaisOrderText extends StatelessWidget {
  final String text1, text2;

  DetaisOrderText({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text2,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'home',
            fontSize: 8,
            color: const Color(0xff200e32),
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          text1,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'home',
            fontSize: 14.5,
            color: const Color(0xff200e32),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.start,
        )
      ],
    );
  }
}
