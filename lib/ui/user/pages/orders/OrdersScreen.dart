import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:matbahk24/Model/Order.dart';
import 'package:matbahk24/Provider/OrderProvider.dart';
import 'package:matbahk24/helpers/constans.dart';
import 'package:matbahk24/helpers/helpers.dart';
import 'package:matbahk24/ui/providers/orderDetail/OrderDetail.dart';
import 'package:matbahk24/widgets/LoginButton.dart';
import 'package:matbahk24/widgets/load_photo2.dart';
import 'package:provider/provider.dart';
class OrdersScreen extends StatelessWidget {
  var _orderProvider;
  @override
  Widget build(BuildContext context) {
    if(_orderProvider==null){

      _orderProvider=Provider.of<OrderProvider>(context);
      WidgetsBinding.instance?.addPostFrameCallback((_){
        _orderProvider.getUserOrders(context: context);
      });
    }
    return !isRegistered()?LoginButton(): _orderProvider.orders.length==0?Center(
      child: Text("لا توجد طلبات".tr(),style: TextStyle(
        fontSize: 14,
        color: Colors.black
      ),),
    )
        :
    Container(
      width: double.infinity,
      child: RefreshIndicator(
        onRefresh: () async {
          return await _orderProvider.getUserOrders(context: context);
        },
        child: ListView.separated(
          separatorBuilder: (ctx,i)=>Divider(indent: 10,endIndent: 10,),
            shrinkWrap: true,
            itemCount: _orderProvider.orders.length,
            itemBuilder: (ctx,i){
            Order order = _orderProvider.orders[i];
          return MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: (){
              pushPage(context: context,page: OrderDetail(order.id,KYellowColor,pageStatus: 1,));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child:LoadPhoto2(order.marketImage,80)
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            child: Text(order.marketName,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 13,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,

                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),

                          Text("${order.price} ${tr("رس")}",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                      Text(orderStatuses[order.status],
                        style: TextStyle(
                            fontSize: 14,
                          color: Colors.green
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: screenWidth-160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(order.date.toString().split("T")[0].toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey
                              ),
                            ),
                            Text("رقم الطلب "+" # "+order.id.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color:Colors.black
                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  final orderStatuses  = ["في انتظار قبول المطبخ","جاري تجهيز طلبك","المندوب في الطريق","تم توصيل الطلب",""];
}
