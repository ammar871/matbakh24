import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:photo_view/photo_view.dart';
class PhotoViewWidget extends StatelessWidget {
  final image;
  PhotoViewWidget(this.image, );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: ()=>pop(context),
          icon: Icon(Icons.arrow_back,color: Colors.white),),
      ),
      body: Container(
          child:PhotoView(
            minScale: 0.5,
            imageProvider: CachedNetworkImageProvider(image),
          )
      ),
    );
  }
}
