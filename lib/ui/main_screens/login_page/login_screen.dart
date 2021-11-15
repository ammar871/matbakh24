import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componts/body_login.dart';

class LoginScreen extends StatelessWidget {
  static String id="/login";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BodyLogin(),
      ),
    );
  }
}
