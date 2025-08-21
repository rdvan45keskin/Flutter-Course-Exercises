void main() {
  var dictionary1 = new Map();
  //key:value
  dictionary1["kitap"] = "book";
  dictionary1["küçük"] = "little";
  var dictionary2 = {"kitap": "book", "küçük": "little"};
  dictionary2["büyük"] = "big";

  print(dictionary1);
  dictionary1.remove("kitap");
  print(dictionary1);

  print(dictionary2);

  //python for döngüsü gibi amk bu
  for (var key in dictionary2.keys) {
    print(key + " : " + dictionary2[key].toString());
  }

  for (var value in dictionary2.values) {
    print(value);
  }

  //aranan şey var mı yok mu true false
  print(dictionary2.containsKey("kitap"));

  //forEach
  dictionary2.forEach((k, v) {
    print(k + " : " + v);
  });
}
