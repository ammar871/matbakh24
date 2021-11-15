import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/componts/BodyAddMeal3.dart';
import 'package:matbahk24/ui/user/pages/best_claint/componts/container_type.dart';

import 'about.dart';
import 'header.dart';

class Content extends StatefulWidget {
  Market market;
  Content(this.market);
  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Future<void> _refreshPage() async {
    // await getUserDetail(status: 1);
    setState(() {
      widget.market = currentUser.market;
    });
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshPage,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Header(widget.market),
          Text(
            'التصنيف'.tr(),
            style: TextStyle(
              fontFamily: 'home',
              fontSize: 6,
              color: const Color(0xfff2f4f3),
              height: 2.8333333333333335,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.market.fields.map((e) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: ContainerType(e.name));
            }).toList(),
          ),
          SizedBox(
            height: 40,
          ),
          // Adobe XD layer: '✏️ Page Title' (text)
          About(widget.market),
          Container(
            color: Colors.red,
          )
        ],
      )),
    );
  }

  @override
  void initState() {
    onComplete = () {
      print("good action");
      setState(() {});
    };
    super.initState();
  }
}
