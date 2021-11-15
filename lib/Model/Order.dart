import 'package:matbahk24/Model/Cart.dart';
import 'package:matbahk24/Model/Market.dart';
import 'package:matbahk24/helpers/helpers.dart';

import 'Driver.dart';
import 'User.dart';

class Order {
  var id;
  var addressId;
  var marketId;
  var marketRate;
  var marketImage;
  var marketName;
  var userId;
  var price;
  var userLat;
  var userLng;
  var marketLat;
  var marketLng;
  var userAddress;
  var payment;
  var marketAdddress;
  var deliveryId;
  var status;
  var date;
  List<Cart> carts=[];
  var market;
  var driver;
  var user;
  Order();
  Order.fromJson(data) {
    final json = data['order'];
    id = json['id'];
    addressId = json['address_id'];
    marketId = json['market_id'];
    price = json['price'];
    payment = json['payment'].toString();
    marketRate = json['market_rate'];
    marketImage =filesUrl+ json['market_image'];
    marketName = json['market_name'];
    userId = json['user_id'];

    userLat = json['user_lat'];
    userLng = json['user_lng'];
    marketLat = json['market_lat'];
    marketLng = json['market_lng'];
    userAddress = json['user_address'];
    marketAdddress = json['market_address'];


    deliveryId = json['delivery_id'];
    status = json['status'];
    date = json['date'].toString();
    if(data['carts']!=null) data['carts']?.forEach((element) {
      carts.add(Cart.fromJson(element));
    });
    if(data['market']!=null) market = Market.fromJson(data['market']);
    if(data['driver']!=null) driver = Driver.fromJson(data['driver']);
    if(data['user']!=null) user = User.fromJson(data,state: 1);
  }
}
