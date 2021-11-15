import 'package:matbahk24/helpers/helpers.dart';

class Photo {
  late int id;
  late String url;
  late String modleId;
  late String modle;

  Photo({required this.id, required this.url, required this.modleId, required this.modle});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = filesUrl+json['url'].toString();
    modleId = json['modleId'];
    modle = json['modle'];
  }

}