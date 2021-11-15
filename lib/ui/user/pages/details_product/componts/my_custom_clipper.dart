import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(1, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 250, size.width + 10, size.height + 10);
    path.lineTo(size.width + 10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}