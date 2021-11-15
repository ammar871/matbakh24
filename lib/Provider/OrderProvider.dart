import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Order.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/main_screens/login_page/login_screen.dart';
import 'package:matbahk24/ui/user/pages/completd_order/CompleteOrderScreen.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:http/http.dart' as http;

import 'CartProvider.dart';

class OrderProvider extends ChangeNotifier{
  addOrder({context, userId,addressId,marketId,price}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['user_id'] = userId.toString();
    jsoMap['address_id'] = addressId.toString();
    jsoMap['market_id'] = marketId.toString();
    jsoMap['market_address'] = "none";
    jsoMap['date'] = DateTime.now().toString();
    jsoMap['user_address'] = "none";
    jsoMap['price'] = price.toString();
    final url = "$baseUrl/order/add";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      replacePage(context: context,page: CompleteOrderScreen());
    } else {
      print("error");

    }
  }

  payOrder({context, userId,addressId,marketId,price,cardId}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['user_id'] = userId.toString();
    jsoMap['payment'] = cardId.toString();
    jsoMap['address_id'] = addressId.toString();
    jsoMap['market_id'] = marketId.toString();
    jsoMap['market_address'] = "none";
    jsoMap['date'] = DateTime.now().toString();
    jsoMap['user_address'] = "none";
    jsoMap['price'] = price.toString();
    final url = "$baseUrl/order/pay";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      replacePage(context: context,page: CompleteOrderScreen());
    } else {
      print("error");

    }
  }

  marketAcceptOrder({context,orderId}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['orderId'] = orderId.toString();

    final url = "$baseUrl/order/market/accept-Order";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    // pop(context);
    print(response.body);
    if (response.statusCode == 200) {
     await getOrderDetail(context: context,orderId: orderId,status:1);
      HelperFunctions.slt.notifyUser(context: context,message: "تم بنجاح");
    } else {
      print("error");
    }
  }

  driverAcceptOrder({context,orderId}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['orderId'] = orderId.toString();
    jsoMap['driverId'] = currentUser.driver.id.toString();
    final url = "$baseUrl/order/driver/accept-Order";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    // pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      await getOrderDetail(context: context,orderId: orderId,status:1);
      HelperFunctions.slt.notifyUser(context: context,message: "تم بنجاح");
    } else {
      print("error");
    }
  }
  driverUpdateOrder({context,orderId}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['orderId'] = orderId.toString();
    jsoMap['driverId'] = currentUser.driver.id.toString();
    final url = "$baseUrl/order/driver/update-order";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    // pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      await getOrderDetail(context: context,orderId: orderId,status:1);
      HelperFunctions.slt.notifyUser(context: context,message: "تم بنجاح");
    } else {
      print("error");
    }
  }

  List<Order> orders = [];
  getUserOrders({context}) async {
    if(!isRegistered())return;
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['userId'] =currentUser.id.toString();
    final url = "$baseUrl/order/get-orders";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      orders=[];
      var data= jsonDecode(response.body);
      data.forEach((element) {
        orders.add(Order.fromJson(element));
      });
    } else {
      print("error");
    }
    notifyListeners();
  }
  List<Order> providerOrders = [];
  List<Order> providerPreviousOrders = [];
  getProviderOrders({context}) async {
 showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['marketId'] =currentUser.market.id.toString();
    final url = "$baseUrl/order/market/get-orders";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      providerOrders=[];
      providerPreviousOrders=[];
      var data= jsonDecode(response.body);
      data.forEach((element) {
        if(element['order']['status']==3){
          providerPreviousOrders.add(Order.fromJson(element));

        }else
        providerOrders.add(Order.fromJson(element));
      });
    } else {
      print("error");
    }
    notifyListeners();
  }

  getDriverOrders({context}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['id'] =currentUser.driver.id.toString();
    final url = "$baseUrl/order/driver/get-orders";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      providerOrders=[];
      providerPreviousOrders=[];
      var data= jsonDecode(response.body);
      data.forEach((element) {
        if(element['order']['status']==3){
          providerPreviousOrders.add(Order.fromJson(element));
        }else
          providerOrders.add(Order.fromJson(element));
      });
    } else {
      print("error");
    }
    notifyListeners();
  }
  var orderDetail;
  getOrderDetail({context,orderId,status = 0}) async {

    if(status==0) showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();
    jsoMap['orderId'] =orderId.toString();
    final url = "$baseUrl/order/detail";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    pop(context);
    print(response.body);
    if (response.statusCode == 200) {
      var data= jsonDecode(response.body);
       orderDetail = Order.fromJson(data);
      total = data['total'].toString();
      tax = data['tax'].toString();
      subtotal = data['subtotal'].toString();
      delivery = (double.parse(data['delivery'].toString())).toString();
    } else {
      print("error");
    }
    notifyListeners();
  }
}