class Product {
  int id = 0;
  int categoryId = 0;
  String productName = "";
  String quantityPerUnit = "";
  double unitPrice = 0.0;
  int unitsInStock = 0;

  //constructor
  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrice, this.unitsInStock);
  
  //jsondan product nesnesine çevirme
  Product.fromJson(Map json) {
    id = int.tryParse(json["id"].toString()) ?? 0; // 0 olarak varsayılan değer
    categoryId = int.tryParse(json["categoryId"].toString()) ?? 0;
    productName = json["productName"] ?? ""; // Boş dize varsayılanı
    quantityPerUnit = json["quantityPerUnit"] ?? "";
    unitPrice = double.tryParse(json["unitPrice"].toString()) ??
        0.0; // 0.0 olarak varsayılan değer
    unitsInStock = int.tryParse(json["unitsInStock"].toString()) ?? 0;
  }
  //jsona çevirme
  Map tojson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quantityPerUnit": quantityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock,
    };
  }
}
