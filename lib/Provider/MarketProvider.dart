import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:http/http.dart' as http;

class MarketProvider extends ChangeNotifier {
  List<Market> markets = [];
  searchMarkets({context, text}) async {
    final url = "$baseUrl/market/search";
    Map<String, String> params = {
      'search': text,
      'lat':locData.latitude.toString(),
      'lng':locData.longitude.toString(),
    };
    final response =
        await http.post(Uri.parse(url),body: params);
    print(response.body);
    if (response.statusCode == 200) {
      markets = [];
      var data = jsonDecode(response.body);
      data.forEach((e) {
        markets.add(Market.fromJson(e));
      });
    } else {
    }
    notifyListeners();
  }
}
