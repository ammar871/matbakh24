import 'package:flutter/cupertino.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/ui/user/pages/home_user/home_user_screen.dart';

import 'item_products.dart';

class ListProducts extends StatelessWidget {
  List<Field> foods= [];
  ListProducts(this.foods);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount:foods.length,
         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 0.9,
            crossAxisSpacing: 10,
            mainAxisSpacing: 2),
           itemBuilder: (BuildContext context, int index) {
          return ItemProduct(foods[index]);
        },
      ),
    );
  }
}
//
// GridView.count(
// crossAxisCount: 2,
// childAspectRatio: (1.3 / 1),
// crossAxisSpacing: 5,
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// mainAxisSpacing: 5,
// children: itemList
//     .map(
// (data) => InkWell(
// onTap: () {
// Navigator.of(context).pushNamed(MenuMarketsScreen.id);
// },
// child: Padding(
// padding: const EdgeInsets.all(12.0),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(10),
// child: Stack(
// children: [
// CachedNetworkImage(
// imageUrl: "$base_url_images${data.image}",
// height: 110,
// fit: BoxFit.cover,
// placeholder: (context, url) => Center(
// child: Container(
// width: 25,
// height: 25,
// child: CircularProgressIndicator()),
// ),
// errorWidget: (context, url, error) => Container(
// height: 110,
// child: Center(
// child: Icon(
// Icons.error,
// size: 25,
// ))),
// ),
// Container(
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [
// Colors.transparent,
// Colors.black.withOpacity(0.5),
// Colors.yellow.withOpacity(0.4),
// ],
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// ),
// ),
// ),
// Positioned(
// bottom: 10,
// right: 10,
// child: Container(
// width: 180,
// child: TextWidget(
// text: data.name,
// fontSize: 18,
// fontColor: Colors.white,
// ),
// ))
// ],
// ),
// ),
// ),
// ),
// )
// .toList(),
// );