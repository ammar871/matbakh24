import 'package:flutter/cupertino.dart';
import 'package:matbahk24/helpers/constans.dart';

class BarAddMeal extends StatelessWidget {
  final int color;
  final String text;


  BarAddMeal(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
      decoration: BoxDecoration(
          color: KYellowColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 20,
              color: const Color(0xff200e32),
              letterSpacing: 0.15000000953674317,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '01',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 20,
                  color: color >= 1
                      ? const Color(0xff200e32)
                      : Color(0xFF200E32).withOpacity(.3),
                  letterSpacing: 0.15000000953674317,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '02',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 20,
                  color: color >= 2
                      ? const Color(0xff200e32)
                      : Color(0xFF200E32).withOpacity(.4),
                  letterSpacing: 0.15000000953674317,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '03',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 20,
                  color: color == 3
                      ? const Color(0xff200e32)
                      : Color(0xFF200E32).withOpacity(.4),
                  letterSpacing: 0.15000000953674317,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}