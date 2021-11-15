

import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/ui/providers/provider_account_detail/componts/product_item.dart';

class ProductList extends StatelessWidget {
  Market market;

  ProductList(this.market);

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
        return ProductItem(market.foods[index]);
      },
    );
  }
}
