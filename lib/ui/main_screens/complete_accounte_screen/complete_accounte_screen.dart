import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componts/body_complete.dart';

class CompleteAccountScreen extends StatelessWidget {


  static String id="/complete";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyCompleteAccount(),
    );
  }
}
