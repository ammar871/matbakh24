import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'componts/body_category.dart';

class CategoryScreen extends StatelessWidget {
  static String id = "/category";
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F3),
      key: _key,
      body: BodyCategory(),
    );
  }
}

List<String> images = [
  "https://media.istockphoto.com/photos/healthy-gut-picture-id1301830934?b=1&k=20&m=1301830934&s=170667a&w=0&h=Jxd6jxYTTpm99kC55tJvSeqGF5C1ZgYm0FlQjKRmGvI=",
  "https://media.istockphoto.com/photos/healthy-food-for-lower-cholesterol-and-heart-care-shot-on-wooden-picture-id1279763992?b=1&k=20&m=1279763992&s=170667a&w=0&h=PP9Z4NeTcx5iZodFRxA4bbRG7QgXef9LCQdIh5lr7oY=",
  "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGZvb2R8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1591188611600-cf65b0e1aed2?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OHwxNDI0MzQwfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1633327760690-d9bb0513f942?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTB8MTQyNDM0MHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1599749011927-9a77278bfa61?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjB8MTQyNDM0MHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
   "https://images.unsplash.com/photo-1478145046317-39f10e56b5e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8Mjg4OTI2fHxlbnwwfHx8fA%3D%3D&dpr=1&auto=format&fit=crop&w=291.2&q=60"


];
