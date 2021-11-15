import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';



class CustomSuffixIcon extends StatelessWidget {
  final String svgIcon;


  CustomSuffixIcon({required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(40,
          20,
          20,
          20),
      child: SvgPicture.asset(svgIcon),
    );
  }
}