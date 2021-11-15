
import 'package:flutter/cupertino.dart';

import 'ItemFinshedOrders.dart';

class ListFinshedOrders extends StatelessWidget {
  const ListFinshedOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return ItemFinshedOrders();
        });
  }
}
