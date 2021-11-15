import 'package:matbahk24/Model/Address.dart';
import 'package:matbahk24/Model/Market.dart';

import 'Driver.dart';

class User {
  var id;
  var knownName;
  var createdAt;
  var city;
  var country;
  var fullName;
  var statuse;
  var role;
  var userName;
  var email;
  var carImage;
  var identityNumber;
  var profileImage;
  var identityImage;
  var ibanNumber;
  var market;
  var driver;
  var balance;
  List<Address> addresses = [];

  User(
      {this.id,
      this.knownName,
      this.createdAt,
      this.city,
      this.market,
      this.driver,
      this.country,
      this.userName,
      this.email,
      this.fullName,
      this.balance,
      this.identityNumber,
      this.ibanNumber,
      this.statuse,
      this.role});

  User.fromJson(Map<String, dynamic> data,{state=0}) {
    var json = data['user'];
    id = json['id'];
    knownName = json['knownName'];
    createdAt = json['createdAt'];
    email = json['email'];
    city = json['city'];
    balance = json['balance'];
    ibanNumber = json['ibanNumber'];
    identityNumber = json['identityNumber'];
    identityImage = json['identityImage'];
    carImage = json['carImage'];
    profileImage = json['profileImage'];
    country = json['country'];
    userName = json['userName'];
    fullName = json['fullName'];
    statuse = json['statuse'];
    role = json['role'];
    if(state == 0){
      if(data['market']!=null) market = Market.fromJson(data['market']);
      if(data['addresses']!=null) data['addresses'].forEach((element) {
        addresses.add(Address.fromJson(element));
      });
    }
    if(data['driver']!=null) driver = Driver.fromJson(data['driver']);
  }
}
