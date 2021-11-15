import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/CreditCard.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:http/http.dart' as http;

class PaymentProvider extends ChangeNotifier{

  List<CreditCard> cards = [];
  getCards(context) async {
    showLoadingDialog(context);
    final url = "$baseUrl/card/get-cards";
    final headers = {
      'Authorization': token,
    };
    Map<String,String> params = {'userId':currentUser.id.toString()};
    final response = await http.post(Uri.parse(url),body: params,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      cards = [];
      var data= jsonDecode(response.body);
      data.forEach((e){
        cards.add(CreditCard.fromJson(e));
      });

      pop(context);
    } else {
      pop(context);
    }
    notifyListeners();
  }

  addCard(context,params,onComplete) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };

    final url = "$baseUrl/card/add";
    final response = await http.post(Uri.parse(url), body: params,headers: headers);
    if (response.statusCode == 200) {
     await getCards(context);

     pop(context);
     onComplete();


    } else {
    }
  }

  deleteCard(context, id,onComplete) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    var jsoMap = Map();

    jsoMap['id'] = id.toString();
    final url = "$baseUrl/card/delete";
    final response = await http.post(Uri.parse(url),body: jsoMap,headers: headers);
    pop(context);

    print(response.body);
    if (response.statusCode == 200) {
     await getCards(context);
     onComplete();
    } else {
    }
    notifyListeners();
  }
}