import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';

class RichTextCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        replacePage(context: context,page: NavigationPage(currentIndex: 1,));
      },
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontFamily: 'home',
            fontSize: 14.5,
            color: const Color(0xff464646),
            height: 1.7,
          ),
          children: [
            TextSpan(
              text: 'هناك مايزيد عن 50 فئة اضغط '.tr(),
            ),
            TextSpan(
              text: 'هنا '.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: 'لتصفحهم جميعا'.tr(),
            ),
          ],
        ),
        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.center,
      ),
    );
  }
}