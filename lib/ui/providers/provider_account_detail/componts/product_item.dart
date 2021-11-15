


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Food.dart';
import 'package:matbahk24/Provider/AuthProvider.dart';
import 'package:matbahk24/helpers/Functions.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/provider_account_detail/provider_account_screen.dart';
import 'package:matbahk24/ui/user/pages/details_product/product_details.screen.dart';
import 'package:matbahk24/widgets/load_photo2.dart';
import 'package:matbahk24/widgets/loading.dart';
import 'package:http/http.dart' as http;

class ProductItem extends StatelessWidget {
  Food food;

  ProductItem(this.food);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushPage(context:context,page:ProductDetailsScreen(food));
      },
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:LoadPhoto2(food.mainImage,screenWidth/2.5,enabled: false,)
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      color: KYellowColor,
                      child: Column(
                        children: [
                          Text(
                            '${food.price}\n ${tr("رس")}',
                            style: TextStyle(
                              fontFamily: 'roboto',
                              fontSize: 14.5,
                              color: Color(0xff1d1d1d),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: KHomeColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: IconButton(
                        padding: EdgeInsets.all(0),

                        iconSize: 20,
                        
                        icon: Icon(Icons.close,size: 20,color: Colors.white,), onPressed: () {

                          deleteFood(context: context,params: {"id":food.id.toString()});
                      },
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
             food.name,
              style: TextStyle(
                fontFamily: 'home3',
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                height: 1.0833333333333333,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
             food.marketName,
              style: TextStyle(
                fontFamily: 'home',
                fontSize: 10,
                color: const Color(0x9ee2e2e2),
                height: 1.7142857142857142,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  deleteFood({context, params}) async {
    showLoadingDialog(context);
    final headers = {
      'Authorization': token,
    };
    final url = "$baseUrl/food/delete";
    final response = await http.post(Uri.parse(url), body: params,headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      // HelperFunctions.slt.notifyUser(context: context,message: "تم بنجاح");
      await getUserDetail(context: context,status: 1);
      pop(context);
      // pop(context);
      replacePage(context: context,page:ProviderAccountScreen(currentUser.market));
    } else {
      pop(context);
    }

  }
}
