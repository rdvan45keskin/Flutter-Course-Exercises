void main() {
  bool sistemeGirmisMi = false;

  if (sistemeGirmisMi == true) {
    print("anasayfaya gidiliyor");
  }

  if (sistemeGirmisMi == false) {
    print("login sayfasına gidiliyor");
  }
  //
  int puan = 45;
  if (puan >= 50) {
    print("Geçti : " + puan.toString());
  } else if (puan >= 40) {
    print("Bütünleme : " + puan.toString());
  } else {
    print("Kaldı : " + puan.toString());
  }
  //
  String not = "A";
  switch (not) {
    case "A":
      {
        print("Süper");
      }
      break;
    case "B":
      {
        print("İyi");
      }
      break;
    case "C":
      {
        print("İdare Eder");
      }
      break;
    case "D":
      {
        print("Kötü");
      }
      break;
    default:
      {
        print("Bilinmiyor");
      }
      break;
  }
}
