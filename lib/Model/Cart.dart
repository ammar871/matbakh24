import 'package:matbahk24/Model/Food.dart';

class Cart {
 var id;
 var quantity;
 var food;
 var price;

  Cart({required this.id, required this.quantity});
  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    food=Food.fromJson(json['food']);

  }


}