import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/Model/Cart.dart';
import 'package:matbahk24/widgets/load_photo2.dart';

class ItemCartList extends StatelessWidget {
  Cart cart;
  var onDelete;
  int state;

  ItemCartList(this.cart,this.state,{this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Colors.black.withOpacity(.1)))),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LoadPhoto2(cart.food.mainImage, 70)),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cart.food.name,
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14.5,
                    color: const Color(0xff200e32),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      cart.quantity.toString(),
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 14.5,
                        color: const Color(0xa8000000),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      " X ",
                      style: // Adobe XD layer: 'Travel' (text)
                          TextStyle(
                        fontFamily: 'home',
                        fontSize: 14.5,
                        color: const Color(0xa8000000),
                      ),
                    ),
                    Text(
                      (cart.food.price).toString(),
                      style: // Adobe XD layer: 'Travel' (text)
                          TextStyle(
                        fontFamily: 'home',
                        fontSize: 14.5,
                        color: const Color(0xa8000000),
                      ),
                    ),
                    Text(
                      "رس".tr(),
                      style: // Adobe XD layer: 'Travel' (text)
                          TextStyle(
                        fontFamily: 'home',
                        fontSize: 14.5,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset("assets/icons/etite.svg"),
                  ],
                )
              ],
            ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(cart.food.price * cart.quantity).toString()} رس ',
                style: TextStyle(
                  fontFamily: 'home',
                  fontSize: 14.5,
                  color: const Color(0xa8ff0000),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),

             if(state==0) IconButton(
                  onPressed: () {
                    onDelete();
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.red,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
