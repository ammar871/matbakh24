import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Cart.dart';
import 'package:matbahk24/Model/CreditCard.dart';
import 'package:matbahk24/Provider/CartProvider.dart';
import 'package:matbahk24/Provider/OrderProvider.dart';
import 'package:matbahk24/Provider/PaymentProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/pages/cart/add_card_page.dart';
import 'package:matbahk24/ui/user/pages/completd_order/CompleteOrderScreen.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:provider/provider.dart';

import 'AddPaymentMethod.dart';
import 'RowTotalPrice.dart';
import 'SliderPayMethod.dart';
import 'TextsTotal.dart';

class ContainerDetailsPrice extends StatefulWidget {
  var images;
  var marketId;
  var addressId;

  ContainerDetailsPrice(
      {this.images, this.marketId, this.addressId, this.controller});

  var controller;

  @override
  State<ContainerDetailsPrice> createState() => _ContainerDetailsPriceState();
}

class _ContainerDetailsPriceState extends State<ContainerDetailsPrice> {
  var _orderProvider;
  var _paymentProvider;
  @override
  Widget build(BuildContext context) {
    if (_orderProvider == null) {
      _orderProvider = Provider.of<OrderProvider>(context);
      _paymentProvider = Provider.of<PaymentProvider>(context);
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _paymentProvider.getCards(context);
      });
    }
    return Container(
      height: 250,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(45), topLeft: Radius.circular(45))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextsTotal(text1: "اجمالى الطلب".tr(), text2: subtotal),
                  SizedBox(
                    height: 5,
                  ),
                  TextsTotal(text1: "التوصيل".tr(), text2: delivery),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextsTotal(text1: "الضريبة".tr(), text2: tax),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RowTotalPrice(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("السعر شامل قيمة الضريبة المضافة",
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14.5,
                    color: KGreenColor,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: DefaultButton(
                  height: 50,
                  text: "التالى".tr(),
                  onPress: () {
                    showBottomSheetPaymentCart(context);
                  },
                  color: KHomeColor,
                  colorText: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  int selctedCard = -1;
  void showBottomSheetPaymentCart(BuildContext context) {
    selctedCard = -1;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext ctx, StateSetter sts) {
              return Container(
                  height: 350,
                  padding: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  decoration: new BoxDecoration(
                      color: KYellowColor,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(30.0))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      AddPaymentMethod(),
                      Container(
                        height: 150,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _paymentProvider.cards.length + 1,
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) {
                              return i == 0
                                  ? InkWell(
                                      onTap: () {
                                        pushPage(
                                            context: context,
                                            page: AddCardPage(() {
                                              sts(() {});
                                            }));
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        margin: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 20,
                                            bottom: 25),
                                        alignment: Alignment.center,
                                        // where to position the child
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: KHomeColor, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),

                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: KHomeColor),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: selctedCard == i - 1
                                              ? Colors.green.withOpacity(0.8)
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 150,
                                      width: 200,
                                      child: InkWell(
                                        onTap: () {
                                          sts(() {
                                            selctedCard = i - 1;
                                          });
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 200,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.asset(
                                                  'assets/images/card.png',
                                                  height: 150,
                                                  width: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              child: Text(
                                                _paymentProvider
                                                        .cards[i - 1].cardNumber
                                                        .toString()
                                                        .substring(
                                                            _paymentProvider
                                                                    .cards[
                                                                        i - 1]
                                                                    .cardNumber
                                                                    .toString()
                                                                    .length -
                                                                8,
                                                            _paymentProvider
                                                                    .cards[
                                                                        i - 1]
                                                                    .cardNumber
                                                                    .toString()
                                                                    .length -
                                                                1) +
                                                    " **** **** ",
                                                style: TextStyle(
                                                  fontFamily: 'home',
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  letterSpacing:
                                                      0.11250000715255737,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              bottom: 50,
                                              left: 40,
                                            ),
                                            Positioned(
                                              child: Text(
                                                _paymentProvider
                                                    .cards[i - 1].expireDate
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'home',
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  letterSpacing:
                                                      0.11250000715255737,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              bottom: 30,
                                              left: 40,
                                            ),
                                            Positioned(
                                              child: Container(
                                                width: 25,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                ),
                                                child: IconButton(
                                                  padding: EdgeInsets.all(0),
                                                  onPressed: () {
                                                    _paymentProvider.deleteCard(
                                                        context,
                                                        _paymentProvider
                                                            .cards[i - 1]
                                                            .id, () {
                                                      sts(() {});
                                                    });
                                                  },
                                                  iconSize: 20,
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              right: 30,
                                              top: 30,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                            }),
                      ),
                      // SliderPayMethod(images: widget.images),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: DefaultButton(
                            height: 50,
                            text: "اتمم عملية الشراء".tr(),
                            onPress: () {
                              if (selctedCard == -1 &&
                                  _paymentProvider.cards.isNotEmpty) {
                                _orderProvider.addOrder(
                                    context: context,
                                    addressId: widget.addressId,
                                    price: total,
                                    marketId: widget.marketId,
                                    userId: currentUser.id);
                              } else {
                                _orderProvider.payOrder(
                                    context: context,
                                    addressId: widget.addressId,
                                    price: total,
                                    marketId: widget.marketId,
                                    userId: currentUser.id,
                                    cardId: _paymentProvider
                                        .cards[selctedCard].id
                                        .toString());
                              }
                            },
                            color: KBluColor,
                            colorText: KYellowColor),
                      ),
                      InkWell(
                        onTap: () {
                          _orderProvider.addOrder(
                              context: context,
                              addressId: widget.addressId,
                              price: total,
                              marketId: widget.marketId,
                              userId: currentUser.id);
                        },
                        child: Text(
                          'الدفع عند التوصيل'.tr(),
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
                  ));
            },
          );
        });
  }
}
