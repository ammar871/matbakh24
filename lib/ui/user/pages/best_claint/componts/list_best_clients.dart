import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';

import 'item_list_best_clients.dart';

class ListBestClients extends StatelessWidget {
  List<Market> markets;

  ListBestClients(this.markets);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,


      child: ListView.builder(
          itemCount: markets.length>3?3:markets.length,

          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return ItemListBestClient(markets[index]);
          }),
    );
  }
}