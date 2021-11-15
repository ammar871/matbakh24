class Field{
  late int id;
  late String name;
  late int status;


   Field.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }
}
