import 'package:flutter/cupertino.dart';

import 'package:matbahk24/ui/user/pages/home_user/componts/title_bar_home.dart';

import 'list_categories.dart';

class BodyCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarHomeUser(),
          SizedBox(
            height: 20,
          ),
          ListCategories()
        ],
      ),
    );
  }
}




