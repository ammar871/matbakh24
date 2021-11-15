import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/edit_market/edit_market.dart';
import 'package:matbahk24/ui/providers/provider_account_detail/componts/content.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal1/add_meal_screen.dart';
import 'package:matbahk24/ui/user/add_meal/add_meal3/componts/BodyAddMeal3.dart';
import 'package:matbahk24/widgets/rich_title_text.dart';

class ProviderAccountScreen extends StatefulWidget {
  Market market;

  ProviderAccountScreen(this.market);

  @override
  State<ProviderAccountScreen> createState() => _ProviderAccountScreenState();
}

class _ProviderAccountScreenState extends State<ProviderAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBlack2Color,
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
        backgroundColor: KYellowColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichTextTitle(Color(0xff000000)),
            MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                pushPage(context: context, page: EditMarket(widget.market));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Text(
                      "تعديل الحساب",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.blue,
                      size: 15,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: Content(widget.market),
      floatingActionButton: getFloatButton(context),
    );
  }

  Padding getFloatButton(context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 5,
          onPressed: () {
            // await pushPage(context: context, page: AddMealScreen());
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddMealScreen(),
              ),
            );
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(20),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: KBluColor,
            ),
            child: SvgPicture.asset(
              "assets/icons/plus.svg",
              width: 23,
              height: 23,
            ),
          ),
        ),
      ),
    );
  }
}
