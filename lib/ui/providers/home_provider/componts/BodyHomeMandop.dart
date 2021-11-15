import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Provider/OrderProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/widgets_mandop/bar_mandop.dart';
import 'package:provider/provider.dart';
import 'ListCurrentOrders.dart';
import 'ListFinshedOrders.dart';
class BodyHomeProvider extends StatelessWidget {
  var _orderProvider;
  @override
  Widget build(BuildContext context) {
    if(_orderProvider==null){
      _orderProvider = Provider.of<OrderProvider>(context);
      WidgetsBinding.instance?.addPostFrameCallback((_){
        _orderProvider.getProviderOrders(context: context);
      });    }
    return ListView(
      shrinkWrap: true,
      children: [
        BarProvider(
    KYellowColor,
        Colors.black,
          text1: "${tr("اهلا بك :")} ${currentUser.market.title}",
          text2: "",
          isfound: false,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: RefreshIndicator(
            onRefresh: () async {
              return _orderProvider.getProviderOrders(context: context);
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'طلبات قيد الانتظار'.tr(),
                      style: TextStyle(
                        fontFamily: 'home',
                        fontSize: 20,
                        color: const Color(0xff200e32),
                        letterSpacing: 0.15000000953674317,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Text(
                  'هذه قائمة بطلبات قيد الانتظار اذا اردت قبول احدها بامكانك الضغط علي قبول وسوف تبدا عملية التوصيل'.tr(),
                  style: TextStyle(
                    fontFamily: 'home',
                    fontSize: 14.5,
                    color: const Color(0x99000000),
                    height: 2.2,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.start,
                ),
                ListCurrentOrders(_orderProvider.providerOrders),
                SizedBox(
                  height: 5,
                ),
                // Text(
                //   'المزيد'.tr(),
                //   style: TextStyle(
                //     fontFamily: 'home',
                //     fontSize: 14.5,
                //     color: const Color(0x99000000),
                //     height: 2.2,
                //   ),
                //   textHeightBehavior:
                //       TextHeightBehavior(applyHeightToFirstAscent: false),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'طلبات سابقة لك'.tr(),
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 20,
                            color: const Color(0xff200e32),
                            letterSpacing: 0.15000000953674317,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        // Adobe XD layer: 'Food' (text)
                        Text(
                          'هنا قائمة باخر الطلبات التي قمت بالتفاعل معها '.tr(),
                          style: TextStyle(
                            fontFamily: 'home',
                            fontSize: 14.5,
                            color: const Color(0x99000000),
                            height: 2.2,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListCurrentOrders(_orderProvider.providerPreviousOrders),
                SizedBox(
                  height: 5,
                ),
                // Text(
                //   'المزيد'.tr(),
                //   style: TextStyle(
                //     fontFamily: 'home',
                //     fontSize: 14.5,
                //     color: const Color(0x99000000),
                //     height: 2.2,
                //   ),
                //   textHeightBehavior:
                //   TextHeightBehavior(applyHeightToFirstAscent: false),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}






