import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';

import 'PhotoView.dart';

class LoadPhoto2 extends StatelessWidget {
  String photoUrl;
  var w;
  double h;
  final enabled;


  LoadPhoto2(this.photoUrl, this.h,{this.w,this.enabled=true});

  @override
  Widget build(BuildContext context) {
    return enabled? GestureDetector(

      onTap: (){
     pushPage(context:context,page: PhotoViewWidget(photoUrl));

      },
      child: Material(
        child: CachedNetworkImage(
          placeholder: (context, url) => Container(
            child: Center(
              child: SpinKitDoubleBounce(
                color: KHomeColor,
                size: 30,

              ),
            ),
            width: h,
            height:w==null? h:w,
            // padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Material(
            child: Container(),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            clipBehavior: Clip.hardEdge,
          ),
          imageUrl: photoUrl,
          width: h,
          height: h,
          fit: BoxFit.cover,
        ),
      ),
    ):Material(
      child: CachedNetworkImage(
        placeholder: (context, url) => Container(
          child: Center(
            child: SpinKitDoubleBounce(
              color: KHomeColor,
              size: 30,

            ),
          ),
          width: h,
          height:w==null? h:w,
          // padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Material(
          child: Image.asset(
            'assets/images/logo.png',
            width: w,
            height: h,
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          clipBehavior: Clip.hardEdge,
        ),
        imageUrl: photoUrl,
        width: h,
        height: h,
        fit: BoxFit.cover,
      ),
    );
  }
}
