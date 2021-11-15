import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/ui/main_screens/sign_up/componts/body_sign_up.dart';

class SignUpScreen extends StatelessWidget {
 static String id ="/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodySignUp(),
    );
  }
}
