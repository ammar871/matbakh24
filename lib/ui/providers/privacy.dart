import 'package:flutter/material.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Privacy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: KBluColor,
          ),
        ),
        backgroundColor: currentUser.role=="driver"?KGreenColor:KYellowColor,
        title: Text("الشروط والأحكام",style: TextStyle(
          fontSize: 16,
          color: Colors.black
        ),)
      ),
      body: WebView(
        initialUrl:"https://matbakh24.com/privacy.html",
      ),
    );
  }
}


