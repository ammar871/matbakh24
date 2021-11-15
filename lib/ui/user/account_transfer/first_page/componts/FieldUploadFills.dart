import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FieldUploadFills extends StatelessWidget {
  final String text;
  final String image;
  final Function onPress;
  bool isFound = false;

  FieldUploadFills(
      {required this.text, required this.onPress, required this.isFound, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            onPress();
          },

          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 0.2,color: Colors.grey),
                color: Colors.white, borderRadius: BorderRadius.circular(35)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'home',
                      fontSize: 10,
                      color: const Color(0x99000000),
                      height: 2.2,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          image,
                          overflow: TextOverflow.ellipsis,
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
                      ),
                      SizedBox(width: 15,),
                      SvgPicture.asset("assets/icons/Icon_upload.svg"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              '  jpg, png  تقبل الملفات من النوع - فقط'.tr(),
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 8,
                color: const Color(0xff000000),
                height: 2.75,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        )
      ],
    );
  }
}