class Product {
  int? id = null;
  late String name;
  late String description;
  double? unitPrice;

  Product(
      {required this.name, required this.description, required this.unitPrice});
  Product.withId(
      {required this.id,
      required this.name,
      required this.description,
      required this.unitPrice});

  //Mapleme denen şey dictionary formatı gibi
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if (id != 0) {
      map["id"] = id;
    }
    return map;
  }

  //dict formatını tersine çevirme
  Product.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString()) ?? 0;
    this.name = o["name"] ?? '';
    this.description = o["description"] ?? '';
    this.unitPrice = double.tryParse(o["unitPrice"].toString());
  }
}
