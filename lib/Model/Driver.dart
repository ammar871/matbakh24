class Driver {
 var    id;
  var knownName;
  var createdAt;
  var aboutText;
  var banarImage;
  var city;
  var country;
  var userId;
  var profileImage;
  var fullName;
  var  statuse;
  var deviceToken;
  var bank;
  var ibanNumber;
  var identityNumber;
  var address;
  var  lat;
  var  lng;
  var  rate;
  var  reviews;
  var  orderCount;

  Driver(
      {required  this.id,
        required this.knownName,
        required this.createdAt,
        required this.aboutText,
        required this.banarImage,
        required this.city,
        required this.country,
        required this.userId,
        required this.profileImage,
        required this.fullName,
        required this.statuse,
        required this.deviceToken,
        required this.bank,
        required this.ibanNumber,
        required this.identityNumber,
        required this.address,
        required this.lat,
        required this.lng,
        required this.rate,
        required this.reviews,
        required this.orderCount});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    profileImage = json['profileImage'];
    fullName = json['fullName'];
    deviceToken = json['deviceToken'];
    bank = json['bank'];
    ibanNumber = json['ibanNumber'];
    identityNumber = json['identityNumber'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    rate = json['rate'];
    reviews = json['reviews'];
    orderCount = json['order_count'];
  }


}
