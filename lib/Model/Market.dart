import 'package:easy_localization/src/public_ext.dart';
import 'package:matbahk24/Model/Field.dart';
import 'package:matbahk24/helpers/helpers.dart';

import 'Food.dart';

class Market {
  var id;
  var title;
  var userId;
  var balance;
  var image;
  var bannarImage;
  var lat;
  var distance;
  var isClosed;
  var lng;
  var phone;
  var status;
  var summary;
  var rate;
  var orderCount;
  List<Field> fields=[] ;
  var foods=[] ;

  Market(
      {required this.id,
        required  this.title,
        required this.userId,
        required this.balance,
        required this.image,
        required this.bannarImage,
        required this.lat,
        required this.isClosed,
        required this.lng,
        required this.phone,
        required this.status,
        required this.summary,
        required this.rate,
        required this.orderCount});

  Market.fromJson(Map<String, dynamic> data) {
    fields=[];
    final json = data['market'];
    id = json['id'];
    title = json['title'];
    userId = json['user_id'];
    balance = json['balance'];
   if( data['dist']!=null) distance = data['dist']+" كم ".tr();
    image =  json['image'];
    bannarImage =json['bannarImage'];
    lat = json['lat'];
    isClosed = json['isClosed'];
    lng = json['lng'];
    phone = json['phone'];
    status = json['status'];
    summary = json['summary'];
    rate = json['rate'];
    orderCount = json['order_count'];
    data['fields']?.forEach((element) {
     fields.add(Field.fromJson(element));
     });

    data['foods']?.forEach((element) {
      foods.add(Food.fromJson(element));
    });

  }


}
