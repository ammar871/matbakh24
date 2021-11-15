import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/Model/Photo.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/widgets/PhotoView.dart';
import 'package:matbahk24/widgets/load_photo2.dart';
import 'package:photo_view/photo_view.dart';

import 'image_product.dart';

class ImagesProductsList extends StatefulWidget {
Food food;

ImagesProductsList(this.food);

  @override
  State<ImagesProductsList> createState() => _ImagesProductsListState();
}

class _ImagesProductsListState extends State<ImagesProductsList> {
  int? posstion;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageProduct(widget.food),
         SizedBox(height: 20,),
          Container(
            height: 70,
            child: ListView.builder(
                itemCount: widget.food.images.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: (){
                      widget.food.mainImage = widget.food.images[i].url;
                      setState(() {
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green, borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.symmetric(horizontal: 3.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child:LoadPhoto2(widget.food.images[i].url,70)

                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

