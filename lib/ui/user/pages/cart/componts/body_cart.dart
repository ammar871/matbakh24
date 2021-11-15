import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matbahk24/Provider/CartProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/helpers/styels.dart';
import 'package:matbahk24/ui/user/UserAddress/MapScreen.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:provider/provider.dart';

import 'BarCart.dart';
import 'ContainerDetailsPrice.dart';
import 'DetailsCart.dart';
import 'ListCarts.dart';

class BodyCart extends StatefulWidget {

  @override
  _BodyCartState createState() => _BodyCartState();
}
var addressId;
class _BodyCartState extends State<BodyCart> {

  final CarouselController _controller = CarouselController();
   List<String> imageList = [
    "assets/images/vis1.png",
    "assets/images/vis2.png",
    "assets/images/visa3.png",
  ];
  var _cartProvider;
  @override
  Widget build(BuildContext context) {
    if(_cartProvider==null){
      _cartProvider=Provider.of<CartProvider>(context);
      addressId =currentUser.addresses[0].id.toString();
      WidgetsBinding.instance?.addPostFrameCallback((_){
        _cartProvider.getCarts(context);
      });
    }
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            child: SingleChildScrollView(
                child: Column(
              children: [
                BarCart((){
                  _cartProvider.getCarts(context);
                }),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                  Column(
                  children: [
                  Text(
                  'قبل البدء في خطوات إتمام الطلب برجاء مراجعة الطلب'.tr(),
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14.5,
                    color: const Color(0x99000000),
                    height: 2.2,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _cartProvider.carts.isNotEmpty? 'تفاصيل طلبك':'السلة فارغة',
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 20,
                        color: const Color(0xff200e32),
                        letterSpacing: 0.15000000953674317,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
                ),
                      SizedBox(
                        height: 20,
                      ),
                      ListCarts(_cartProvider.carts,0,provider:_cartProvider
                        )

                    ],
                  ),
                )
              ],
            )),
          ),
        ),
       if(_cartProvider.carts.isNotEmpty) ContainerDetailsPrice(
          controller: _controller,
          images: imageList,
          marketId: _cartProvider.carts[0].food.marketId,
          addressId: addressId.toString(),

        )
      ],
    );
  }
}
















