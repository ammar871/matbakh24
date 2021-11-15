import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Cart.dart';

import 'ItemCartList.dart';

class ListCarts extends StatelessWidget {
List<Cart> carts;
var provider;
int state;



  ListCarts(this.carts,this.state,{this.provider});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: carts.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return ItemCartList(carts[index],state,onDelete: (){
            provider.deleteCart(context,carts[index].id);
          },);
        });
  }
}