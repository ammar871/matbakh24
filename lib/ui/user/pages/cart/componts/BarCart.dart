import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/Model/Address.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/helpers/styels.dart';

import 'body_cart.dart';

class BarCart extends StatefulWidget {
  Function onChange;

  BarCart(this.onChange);

  @override
  _BarCartState createState() => _BarCartState();
}

class _BarCartState extends State<BarCart> {
  var currentValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
      decoration: BoxDecoration(
          color: KYellowColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'سلة الطلبات'.tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 20,
              color:  Colors.white,
              letterSpacing: 0.15000000953674317,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // StylesWidget.getSvg("assets/icons/pin.svg", 15, 15),
              SizedBox(
                width: 20,
              ),
              Text(
                ' التوصيل علي : '.tr(),
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'home3',
                  fontSize: 15,
                  color:  Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.left,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<Address>(
                      hint: Text(
                        "",
                        style: TextStyle(
                          fontFamily: 'home3',
                          fontSize: 17,
                          color: const Color(0xff383838),
                          fontWeight: FontWeight.bold,
                          height: 2,
                        ),
                      ),
                      isExpanded: false,
                      value: currentValue != null
                          ? currentValue
                          : currentUser.addresses[0],
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                        color: KBluColor,
                      ),
                      // icon: Visibility(visible: false, child: SizedBox(),),
                      underline: SizedBox(),
                      onChanged: (value) {
                        setState(() {
                          currentValue = value!;
                        });
                        addressId = currentValue.id;

                        widget.onChange();
                      },
                      items: currentUser.addresses
                          .map<DropdownMenuItem<Address>>((Address value) {
                        return DropdownMenuItem<Address>(
                          value: value,
                          child: Text(
                            "     " + value.lable,
                            style: TextStyle(
                              fontFamily: 'home3',
                              fontSize: 15,
                              color: KGreenColor,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }).toList()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
