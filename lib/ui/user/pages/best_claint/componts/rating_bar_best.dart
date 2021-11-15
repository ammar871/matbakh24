import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:matbahk24/helpers/constans.dart';

class RatingBarBest extends StatelessWidget {
  var rate;

  RatingBarBest(this.rate);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: 17,
      initialRating:double.parse(rate.toString()) ,
      direction: Axis.horizontal,
      itemCount: 5,
      ignoreGestures: true,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: Color(0xFFD2A51B),
        ),
        half: Icon(Icons.star_border, color:Color(0xFFD2A51B)),
        empty: Icon(Icons.star_border, color:Color(0xFFD2A51B)),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}