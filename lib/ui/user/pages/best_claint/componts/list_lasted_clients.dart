import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Market.dart';

import 'item_lasted_clints.dart';

class ListLastedClients extends StatelessWidget {
  List<Market> markets;

  ListLastedClients(this.markets);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: markets.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return ItemLastedClients(markets[index]);
        });
  }
}
