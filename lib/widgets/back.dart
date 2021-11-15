import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: KBluColor,
      ),
    );
  }
}
