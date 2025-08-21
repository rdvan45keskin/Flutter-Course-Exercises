void main() {
  selamVer();
  selamVer2("Rıdvan");
  selamVer2("2");

  //return edilen değeri bir değere atamamız lazım
  var hesapSonucu = hesapla(100000, 15);
  print(hesapSonucu);

  test1(3);
  test2(sayi1: 1, sayi2: 2, sayi3: 3);
}

void selamVer() {
  print("Selam");
}

void selamVer2(String user) {
  print("selam " + user);
}

//return edilen değeri bir değere atamamız lazım
double hesapla(double krediTutari, double yuzde) {
  return krediTutari * (yuzde / 100);
}

//opsiyonel olarak yapma
void test1(int sayi1, [int? sayi2, int? sayi3]) {
  print(sayi1);
  print(sayi2);
  print(sayi3);
}

void test2({int? sayi1, int? sayi2, int? sayi3}) {
  print(sayi1);
  print(sayi2);
  print(sayi3);
}
