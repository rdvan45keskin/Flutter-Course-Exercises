void main() {
  for (var i = 1; i <= 10; i++) {
    print(i);
  }

  //for
  var products = ["Laptop", "Mouse", "Keyboard"];
  products.add("Monitor");
  for (var i = 0; i < products.length; i++) {
    print(products[i]);
  }

  //for each
  for (var product in products) {
    print(product);
  }

  //while
  var sayi = 10;
  while (0 < sayi) {
    print(sayi);
    sayi--;
  }

  //do-while
  var sayi2 = 10;
  do {
    print("sayi 2 = " + sayi2.toString());
    sayi2++;
  } while (sayi2 > 1000);
}
