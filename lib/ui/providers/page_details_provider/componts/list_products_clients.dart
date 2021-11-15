import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Market.dart';

import 'item_list_product_of_client.dart';

class ListProductsOfClints extends StatelessWidget {
  Market market;

  ListProductsOfClints(this.market);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: market.foods.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.85,
          crossAxisSpacing: 8,
          mainAxisSpacing: 2),
      itemBuilder: (BuildContext context, int index) {
        return ItemListProductsOfClient(market.foods[index]);
      },
    );
  }
}
