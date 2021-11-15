import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Cart.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/user/navigation_page/navigation_page.dart';
import 'package:matbahk24/ui/user/pages/cart/componts/body_cart.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:http/http.dart' as http;


var total="";
var subtotal="";
var tax="";
var delivery="";
class CartProvider extends ChangeNotifier{


  addCart({context, foodId,quantity,price,market_id}) async {
    if(!isRegistered()){
      replacePage(context: context,page: LoginScreen());
      return;
    }

    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['food_id'] = foodId.toString();
    jsoMap['quantity'] = quantity.toString();
    jsoMap['user_id'] = currentUser.id.toString();
    jsoMap['price'] = price.toString();
    jsoMap['market_id'] = market_id.toString();
    final url = "$baseUrl/cart/add";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      print("good");
    } else {
      print("error");

    }
    pop(context);
  }


  deleteCart(context, id) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();

    jsoMap['id'] = id.toString();
    final url = "$baseUrl/cart/delete";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      getCarts(context);
    } else {
      print("error");
    }
    pop(context);
  }

  List<Cart> carts = [];
  getCarts(context) async {

    if(!isRegistered())return;
    showLoadingDialog(context);
    final url = "$baseUrl/cart/get-carts";
    final headers = {
      'Authorization': token,
    };
    Map<String,String> params = {'addressId':addressId.toString()};
    final response = await http.post(Uri.parse(url),body: params,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      carts = [];
      var data= jsonDecode(response.body);
      data['cartsResponse'].forEach((e){
        carts.add(Cart.fromJson(e));
      });
      total = data['total'].toString();
      tax = data['tax'].toString();
      subtotal = data['subtotal'].toString();
      delivery = (double.parse(data['delivery'].toString())).toString();
      pop(context);
    } else {
      pop(context);
    }
    notifyListeners();
  }
}