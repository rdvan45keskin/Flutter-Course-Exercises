void main() {
  //PersonelManager personelManager = new PersonelManager();
  var personelManager = PersonelManager();
  personelManager.add();
}

class PersonelManager {
  void add() {
    print("Personel eklendi");
  }

  void update() {
    print("Personel güncellendi");
  }

  void delete() {
    print("Personel silindi");
  }
}

class CustomerManager {
  void add() {
    print("Müşteri eklendi");
  }

  void update() {
    print("Müşteri güncellendi");
  }

  void delete() {
    print("Müşteri silindi");
  }
}
