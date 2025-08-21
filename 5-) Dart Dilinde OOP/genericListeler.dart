void main() {
  //type safety
  List<String> sehirler = List<String>.filled(3, "");
  sehirler[0] = "Ankara";
  sehirler[1] = "Istanbul";
  sehirler[2] = "Izmir";

  print(sehirler);

  List<String> urunler = ["Laptop", "Mouse", "Keyboard"];
  print(urunler);

  var product1 = Product("TV", 550);
  var product2 = Product("Telefon", 5000);
  List<Product> products = [product1, product2];
  for (var product in products) {
    print("Ürün adı : ${product._name}, fiyat : ${product._price} ");
  }
}

class Product {
  late String _name;
  late double _price;

  Product(String name, double price) {
    this._name = name;
    this._price = price;
  }
}
