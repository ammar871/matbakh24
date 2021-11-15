import 'dart:math';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Provider/CartProvider.dart';
import 'package:matbahk24/Provider/OrderProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/traking_pages/componts/BodyTrakingMandop.dart';
import 'package:matbahk24/ui/user/pages/cart/componts/ListCarts.dart';
import 'package:matbahk24/ui/user/pages/cart/componts/RowTotalPrice.dart';
import 'package:matbahk24/ui/user/pages/cart/componts/TextsTotal.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/load_photo2.dart';
import 'package:provider/provider.dart';

class OrderDetail extends StatelessWidget {
  var pageStatus;
  final color;

  int id;
  OrderDetail(this.id,this.color, {this.pageStatus = 0});
  List<String> imageList = [
    "assets/images/vis1.png",
    "assets/images/vis2.png",
    "assets/images/visa3.png",
  ];
  var _orderProvider;
  @override
  Widget build(BuildContext context) {
    if (_orderProvider == null) {
      _orderProvider = Provider.of<OrderProvider>(context);
      _orderProvider.orderDetail = null;

      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _orderProvider.getOrderDetail(context: context, orderId:id);
      });
    }
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: KBluColor,
            ),
          ),
          backgroundColor: color,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "  طلب رقم ",
                  style: TextStyle(
                      fontFamily: 'home3',
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: "  #" + id.toString(),
                        style: TextStyle(
                          fontFamily: 'home',
                          fontSize: 25,
                          color: Colors.black,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            return await _orderProvider.getOrderDetail(
                context: context, orderId: id);
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              if (_orderProvider.orderDetail != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      TextsTotal(
                                          text1: "اسم المستخدم",
                                          text2: _orderProvider
                                              .orderDetail.user.fullName),
                                      TextsTotal(
                                          text1: "رقم الهاتف",
                                          text2: _orderProvider
                                              .orderDetail.user.userName),
                                      Divider(),
                                      if (_orderProvider.orderDetail.driver !=
                                          null)
                                        Column(
                                          children: [
                                            TextsTotal(
                                                text1: "اسم المندوب",
                                                text2: _orderProvider
                                                    .orderDetail
                                                    .driver
                                                    .fullName),
                                            Divider(),

                                            // TextsTotal(
                                            //     text1: "رقم الهاتف",
                                            //     text2: _orderProvider
                                            //         .orderDetail
                                            //         .driver
                                            //         .userName),
                                          ],
                                        )
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "طريقة الدفع",
                                        style: TextStyle(
                                          fontFamily: 'home',
                                          fontSize: 14,
                                          color: Colors.black,
                                          letterSpacing: 0.15000000953674317,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        (_orderProvider.orderDetail.payment=="0"?"الدفع نقدا عند التوصيل":"الطلب مدفوع"),
                                        style: TextStyle(
                                          fontFamily: 'home',
                                          fontSize: 14,
                                          color: Colors.green,
                                          letterSpacing: 0.15000000953674317,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),

                                Divider(),


                                Text(
                                  'تفاصيل طلبك',
                                  style: TextStyle(
                                    fontFamily: 'home',
                                    fontSize: 20,
                                    color: const Color(0xff200e32),
                                    letterSpacing: 0.15000000953674317,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListCarts(_orderProvider.orderDetail.carts,1),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'حالة الطلب',
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
                          )
                        ],
                      )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      decoration: BoxDecoration(),
                      child: ContainersSetps(_orderProvider.orderDetail.status),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          if (pageStatus != 1)
                            Column(
                              children: [
                                Text(
                                  'موقع العميل',
                                  style: TextStyle(
                                    fontFamily: 'home',
                                    fontSize: 20,
                                    color: const Color(0xff200e32),
                                    letterSpacing: 0.15000000953674317,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    HelperFunctions.slt.openGoogleMapLocation(
                                        _orderProvider.orderDetail.userLat, _orderProvider.orderDetail.userLng);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    child: LoadPhoto2(
                                      'https://maps.googleapis.com/maps/api/staticmap?zoom=18&size=600x300&maptype=roadmap&markers=${_orderProvider.orderDetail.userLat.toString()},${_orderProvider.orderDetail.userLng.toString()}&key=AIzaSyDFZhFfswZpcjeUDYm6C7H46JLdSonK0f4',
                                      200,
                                      w: 500.0,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (pageStatus != 0)
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'موقع المطبخ',
                                  style: TextStyle(
                                    fontFamily: 'home',
                                    fontSize: 20,
                                    color: const Color(0xff200e32),
                                    letterSpacing: 0.15000000953674317,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    HelperFunctions.slt.openGoogleMapLocation(
                                        _orderProvider.orderDetail.userLat, _orderProvider.orderDetail.userLng);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    child: LoadPhoto2(
                                      'https://maps.googleapis.com/maps/api/staticmap?zoom=18&size=600x300&maptype=roadmap&markers=${_orderProvider.orderDetail.marketLat.toString()},${_orderProvider.orderDetail.marketLng.toString()}&key=AIzaSyDFZhFfswZpcjeUDYm6C7H46JLdSonK0f4',
                                      200,
                                      w: 500.0,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                    )
                  ],
                ),
            ],
          ),
        ),
        bottomSheet: _orderProvider.orderDetail == null
            ? SizedBox(
                height: 1,
              )
            : Container(
                height: 260,
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45),
                          topLeft: Radius.circular(45))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextsTotal(
                                text1: "اجمالى الطلب".tr(), text2: subtotal),
                            SizedBox(
                              height: 5,
                            ),
                            TextsTotal(text1: "التوصيل".tr(), text2: delivery),
                            SizedBox(
                              height: 5,
                            ),
                            // TextsTotal(text1: "الضريبة".tr(), text2: tax),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),                      RowTotalPrice(),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                            "السعر شامل قيمة الضريبة المضافة",
                            style:TextStyle(

                              fontFamily: 'home',
                              fontSize: 14.5,
                              color: KGreenColor,
                              fontWeight: FontWeight.w700,
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      if (pageStatus == 0 &&
                          _orderProvider.orderDetail.status == 0)
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: DefaultButton(
                              height: 50,
                              text: "قبول الطلب".tr(),
                              onPress: () {
                                _orderProvider.marketAcceptOrder(
                                    context: context, orderId: id);
                              },
                              color: color,
                              colorText: Colors.black),
                        ),
                      if (pageStatus == 2 &&
                          _orderProvider.orderDetail.deliveryId == 0)
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: DefaultButton(
                              height: 50,
                              text: "قبول الطلب".tr(),
                              onPress: () {
                                if (_orderProvider.orderDetail.deliveryId ==
                                    0) {
                                  print("1");
                                  _orderProvider.driverAcceptOrder(
                                      context: context, orderId: id);
                                }
                              },
                              color: color,
                              colorText: Colors.black),
                        ),
                      if (pageStatus == 2 &&
                          _orderProvider.orderDetail.status == 1 &&
                          _orderProvider.orderDetail.deliveryId != 0)
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: DefaultButton(
                              height: 50,
                              text: "تم استلام الطلب من المطبخ".tr(),
                              onPress: () {
                                _orderProvider.driverUpdateOrder(
                                    context: context, orderId: id);
                                print("2");
                              },
                              color: color,
                              colorText: Colors.black),
                        ),
                      if (pageStatus == 2 &&
                          _orderProvider.orderDetail.status == 2)
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: DefaultButton(
                              height: 50,
                              text: "تم توصيل الطلب للعميل",
                              onPress: () {
                                _orderProvider.driverUpdateOrder(
                                    context: context, orderId: id);
                              },
                              color: color,
                              colorText: Colors.black),
                        )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
