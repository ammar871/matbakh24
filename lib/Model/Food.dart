import 'package:matbahk24/Model/Photo.dart';
import 'package:matbahk24/helpers/helpers.dart';

class Food {
  var id;
  var name;
  var desc;
  var attatchments;
  var serveWay;
  var notes;
  var mainImage;
  var price;
  var persons;
  var preparationTime;
  var categoryId;
  var lat;
  var lng;
  var marketId;
  var marketName;
  List<Photo> images = [];
  Food(
      {required this.id,
        required  this.name,
        required this.desc,
        required this.attatchments,
        required this.serveWay,
        required this.notes,
        required this.price,
        required this.persons,
        required this.preparationTime,
        required this.categoryId,
        required this.lat,
        required this.lng,
        required this.marketId});
  Food.fromJson(Map<String, dynamic> data) {
    final json = data['food'];
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    attatchments = json['attatchments'];
    serveWay = json['serve_way'];
    notes = json['notes'];
    price = json['price'];
    persons = json['persons'];
    marketName = json['marketName'];
    preparationTime = json['preparation_time'];
    categoryId = json['category_id'];
    lat = json['lat'];
    lng = json['lng'];
    marketId = json['market_id'];
    data['photos'].forEach((e){
      images.add(Photo.fromJson(e));
    });
    mainImage = images.isNotEmpty?images[0].url:filesUrl+"logo.png";
  }
}