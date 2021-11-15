class Address {
 var id;
 var userId;
 var lable;
 var lat;
 var lng;

  Address({required this.id, required this.userId, required this.lable, required this.lat, required this.lng});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    lable = json['lable'];
    lat = json['lat'];
    lng = json['lng'];
  }


}