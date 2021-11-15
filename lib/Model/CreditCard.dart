class CreditCard {
  var id;
  var name;
  var cardNumber;
  var expireDate;
  var userId;
  var cvv;



  CreditCard.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    cardNumber = json['card_number'];
    expireDate = json['expire_date'];
    userId = json['user_id'];
    cvv = json['cvv'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['card_number'] = this.cardNumber;
    data['expire_date'] = this.expireDate;
    data['user_id'] = this.userId;
    data['cvv'] = this.cvv.toString();
    return data;
  }
}
