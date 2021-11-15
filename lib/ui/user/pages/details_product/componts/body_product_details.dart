import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/Provider/CartProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/UserAddress/MapScreen.dart';
import 'package:matbahk24/ui/user/pages/cart/cart_screen.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:provider/provider.dart';

import 'all_details_product.dart';

class BodyProductDetails extends StatefulWidget {
  Food food;

  BodyProductDetails(this.food);

  @override
  _BodyProductDetailsState createState() => _BodyProductDetailsState();
}

class _BodyProductDetailsState extends State<BodyProductDetails> {
  int counter = 1;
  var _cartProvider;
  @override
  Widget build(BuildContext context) {




    if (_cartProvider == null) {
      _cartProvider = Provider.of<CartProvider>(context);
    }
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            AllDetailsProducts(
              food: widget.food,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: double.infinity,
              color: Colors.black.withOpacity(.5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Adobe XD layer: '✏️ Page Title' (text)
                    // Text(
                    //   ' ${tr("السعر")}  ${widget.food.price.toString()} ${tr("رس")} ',
                    //   style: TextStyle(
                    //     fontFamily: 'home3',
                    //     fontSize: 15,
                    //     color:  Colors.black,
                    //     letterSpacing: 0.11250000715255737,
                    //   ),
                    //   textAlign: TextAlign.start,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                  if(currentUser.role=="user")  DefaultButton(
                      colorText: Colors.black,
                      height: 40,
                      text: "أضف للسلة".tr(),
                      color: KYellowColor,
                      onPress: () {
                        showBottomSheetCart();
                      },
                    ),
                    SizedBox(height: 18),
                    // Adobe XD layer: '↳ ✏️ Label' (text)
                    // Text(
                    //   'اضف للمفضلة',
                    //   style: TextStyle(
                    //     fontFamily: 'home',
                    //     fontSize: 16,
                    //     color: const Color(0xff989898),
                    //     height: 1,
                    //   ),
                    //   textHeightBehavior:
                    //       TextHeightBehavior(applyHeightToFirstAscent: false),
                    //   textAlign: TextAlign.left,
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showBottomSheetCart() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext ctx, StateSetter sts) {
              return Container(
                  height: 280,
                  padding: EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  decoration: new BoxDecoration(
                      color: KYellowColor,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0))),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      children: [
                        // Adobe XD layer: '✏️ Page Title' (text)
                        Text(
                          'برجاء تحديد العدد'.tr(),
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 20,
                            color: const Color(0xff022c43),
                            letterSpacing: 0.15000000953674317,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                sts(() {
                                  counter++;
                                });
                              },
                              height: 40,
                              color: Colors.white,
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.add,
                                color: Color(0xFF022C43),
                                size: 30,
                              ),
                            ),

                            SizedBox(
                              width: 20,
                            ),
                            // Adobe XD layer: '✏️ Page Title' (text)
                            Text(
                              "$counter",
                              style: TextStyle(
                                fontFamily: 'home',
                                fontSize: 40,
                                color: const Color(0xff022c43),
                                letterSpacing: 0.30000001907348633,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                sts(() {
                                  if (counter != 1) {
                                    counter--;
                                  }
                                });
                              },
                              height: 40,
                              color: Colors.white,
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.remove,
                                color: Color(0xFF022C43),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        DefaultButton(
                            height: 43,
                            text: "تابع الى السلة".tr(),
                            onPress: () async {
                            await  _cartProvider.addCart(
                                  context: context,
                                quantity: counter,
                                market_id: widget.food.marketId.toString(),
                                  foodId: widget.food.id.toString(),
                                  price: counter*widget.food.price);
                            pop(context);
                            if(currentUser.addresses==null||currentUser.addresses.isEmpty){
                              replacePage(context: context,page: MapScreen((){}));
                            }else
                            replacePage(context: context,page: CartScreen());
                            },
                            color: KBluColor,
                            colorText: KYellowColor),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            await  _cartProvider.addCart(
                                context: context,
                                quantity: counter,
                                market_id: widget.food.marketId.toString(),

                                foodId: widget.food.id.toString(),
                                price: counter*widget.food.price);
                            pop(context);
                            pop(context);                          },
                          child: Text(
                            'متابعة التسوق'.tr(),
                            style: TextStyle(
                              fontFamily: 'home',
                              fontSize: 15,
                              color: const Color(0xff022c43),
                              letterSpacing: 0.11250000715255737,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ));
            },
          );
        });
  }
}
