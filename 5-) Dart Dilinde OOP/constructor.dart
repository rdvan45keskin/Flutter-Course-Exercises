void main() {
  //PersonelManager personelManager = new PersonelManager();
  var personelManager = PersonelManager();
  personelManager.add();

  var customerManager = CustomerManager();
  //customerin withInfo isimli constructoruyla çalışcak
  var customer1 = Customer.withInfo("Engin", "Demiroğ");
  //customerin default constructoruyla çalışcak
  var customer2 = Customer();
  customer2._firstName = "Rıdvan";
  customer2._lastName = "Keskinov";
  customerManager.add(customer1);
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
  void add(Customer customer) {
    print(
        "Müşteri eklendi : " + customer._firstName + " " + customer._lastName);
  }

  void update() {
    print("Müşteri güncellendi");
  }

  void delete() {
    print("Müşteri silindi");
  }
}

class Customer {
  //değer tanımlama
  String _firstName = "";
  String _lastName = "";

  //constructor parametresiz
  Customer() {}

  //constructor parametreli
  Customer.withInfo(String firstName, String lastName) {
    // this demek classtaki parametre
    // Customer classının _firstnamesi parametreden gelen firstnameye eşittir.
    this._firstName = firstName;
    this._lastName = lastName;
  }
}
