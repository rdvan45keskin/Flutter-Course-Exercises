void main() {
  //Fixed lenght list -- sabit uzunluklu listeler
  var urunler = List.filled(5, "");
  urunler[0] = "Laptop";
  urunler[1] = "Mouse";
  urunler[2] = "Keyboard";
  urunler[3] = "Monitor";
  urunler[4] = "Mic";

  print(urunler);
  print(urunler[2]);

  //Growable List -- değişebilen listeler

  var urunler2 = <String>[]; // Değişken boyutlu bir liste
  urunler2.add("Laptop");
  urunler2.add("Mouse");
  urunler2.add("Keyboard");
  urunler2.add("Monitor");
  urunler2.add("Mic");
  print(urunler2);

  //
  var sehirler = ["Ankara", "Istanbul", "Izmir"];
  print(sehirler);
  sehirler.add("Manisa");
  print(sehirler);

  print(sehirler
      .where((i) => i.contains("a"))); //a harfi içeren şehirleri listele

  print(sehirler.first);
  print(sehirler.length);
  print(sehirler.reversed);
}
