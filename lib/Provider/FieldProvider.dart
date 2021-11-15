import 'dart:convert';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/Model/Order.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/widgets/RatingBar.dart';
import 'package:matbahk24/widgets/default_button.dart';
import 'package:matbahk24/widgets/load_photo2.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:http/http.dart' as http;

List<Field> fields = [];

class FieldProvider extends ChangeNotifier {
  List<Food> foods = [];
  List<Field> filds = [];
  getHome(context) async {
    showLoadingDialog(context);
    final url = "$baseUrl/get-home";
    final response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      foods = [];
      fields = [];
      final data = jsonDecode(response.body);
      data['fields'].forEach((e) {
        fields.add(Field.fromJson(e));
      });
      filds = fields;
      data['foods'].forEach((e) {
        foods.add(Food.fromJson(e));
      });
      pop(context);
      checkUnRatedOrder(context: context);
    } else {
      pop(context);
    }
    notifyListeners();
  }

  List<Market> markets = [];
  getFieldMarkets(context, id) async {
    markets = [];
    showLoadingDialog(context);
    final url = "$baseUrl/field/markets";
    Map<String, String> params = {'fieldId': id.toString()};
    final response =
        await http.get(Uri.parse(url).replace(queryParameters: params));
    print(response.body);
    if (response.statusCode == 200) {
      markets = [];
      var data = jsonDecode(response.body);
      data.forEach((e) {

        markets.add(Market.fromJson(e));
      });
      pop(context);
    } else {
      pop(context);
    }
    notifyListeners();
  }

  checkUnRatedOrder({context}) async {

    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['userId'] = currentUser.id;

    final url = "$baseUrl/order/un-rated";
    final response =
        await http.post(Uri.parse(url), body: jsoMap, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data != 1) {
        ratingDialog(
          context,
          data['id'],
          data['market_image'],
          data['market_name'],
        );
      }
    } else {
      print("error");
    }
  }
  ratingDialog(context, orderId, marketImage, marketName) {
    String driverRate = "3";
    String marketRate = "3";

    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,

      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: context,
      pageBuilder: (_, __, ___) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          content: Container(
            height: 530,
            width: screenWidth - 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          onPressed: (){
                            rateOrder(
                                state: 1,
                                context: context,
                                orderId: orderId.toString(),
                                driverRate: driverRate,
                                marketRate: marketRate);
                          },
                          icon: Icon(
                  Icons.close,
                  size: 40,
                  color: Colors.black,
                ),
                        ),

                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: LoadPhoto2(filesUrl + marketImage, 90)),
                ),
                Text(
                  marketName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 0.15000000953674317,
                  ),
                ),


                SizedBox(
                  height: 10,
                ),
                Text(
                  "كيف كان المندوب".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    letterSpacing: 0.15000000953674317,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RatingBarWidget(
                  onRate: (rating) {
                    driverRate = rating.toInt().toString();

                  },
                  ratingValue: 0,
                  ignorGesture: false,
                  emptColor: Colors.grey,
                  fillColor: KYellowColor,
                  itemSize: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "تقييم المطبخ".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    letterSpacing: 0.15000000953674317,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RatingBarWidget(
                  ratingValue: 0,
                  onRate: (double rating) {
                    marketRate = rating.toInt().toString();
                    print(marketRate);
                  },
                  ignorGesture: false,
                  emptColor: Colors.grey,
                  fillColor: KYellowColor,
                  itemSize: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 200,
                    child: DefaultButton(
                        height: 40,
                        text: "تقييم".tr(),
                        onPress: () {
                          rateOrder(
                              state: 0,
                              context: context,
                              orderId: orderId.toString(),
                              driverRate: driverRate,
                              marketRate: marketRate);
                        },
                        color: KHomeColor,
                        colorText: Colors.white)),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
  rateOrder({context, orderId, driverRate, marketRate, state = 0}) async {
    if (state == 0) showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['orderId'] = orderId;
    jsoMap['driverRate'] = driverRate;
    jsoMap['marketRate'] = marketRate;
    final url = "$baseUrl/order/rate";
    final response =
        await http.post(Uri.parse(url), body: jsoMap, headers: headers);
    if (state == 0) pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      pop(context);
      if (state == 0)
        HelperFunctions.slt
            .notifyUser(context: context, message: "شكرا لك علي تقييمنا");
    } else {
      print("error");
    }
  }
}
