void main() {
  //PersonelManager personelManager = new PersonelManager();
  var personelManager = PersonelManager();
  var personel = Personel.withInfo("Gülcan", "Keskin", 10000);
  personelManager.add(personel);
  personelManager.update(personel);
  personelManager.delete(personel);

  print("/************************************\n");

  var customerManager = CustomerManager();
  //customerin withInfo isimli constructoruyla çalışcak
  var customer1 = Customer.withInfo("Engin", "Demiroğ", 5000);
  //customerin default constructoruyla çalışcak
  customerManager.add(customer1);
  customerManager.update(customer1);
  customerManager.delete(customer1);

  var customer2 = Customer();
  customer2._firstName = "Rıdvan";
  customer2._lastName = "Keskinov";

  Personel personel1 = Personel();
  personel1._firstName = "Yasuo";
  personel1._maas = 5000;
  var controller = PersonController();
  controller.operation(personel1);
}

//miras alınacak class
class Person {
  String _firstName = "";
  String _lastName = "";
}

class Customer extends Person {
  double _balance = 0;
  //constructor parametresiz
  Customer() {}

  //constructor parametreli
  Customer.withInfo(String firstName, String lastName, double balance) {
    // this demek classtaki parametre
    // Customer classının _firstnamesi parametreden gelen firstnameye eşittir.
    this._firstName = firstName;
    this._lastName = lastName;
    this._balance = balance;
  }
}

class Personel extends Person {
  //değer tanımlama
  double? _maas = 0;

  //constructor parametresiz
  Personel() {}

  //constructor parametreli
  Personel.withInfo(String firstName, String lastName, [double? maas]) {
    // this demek classtaki parametre
    // Customer classının _firstnamesi parametreden gelen firstnameye eşittir.
    this._firstName = firstName;
    this._lastName = lastName;
    this._maas = maas;
  }
}

//deneme
class PersonController {
  void operation(Person person) {
    print("Inheriance demo : " + person._firstName);
  }
}

// fonksiyonlar
class PersonelManager {
  void add(Personel personel) {
    print("Personel eklendi : " +
        personel._firstName +
        " " +
        personel._lastName +
        ";\nMaas : " +
        personel._maas.toString());
  }

  void update(Personel personel) {
    print("Personel güncellendi : " +
        personel._firstName +
        " " +
        personel._lastName +
        ";\nMaas : " +
        personel._maas.toString());
  }

  void delete(Personel personel) {
    print(
        "Personel silindi : " + personel._firstName + " " + personel._lastName);
  }
}

// fonksiyonlar
class CustomerManager {
  void add(Customer customer) {
    print("Müşteri eklendi : " +
        customer._firstName +
        " " +
        customer._lastName +
        ";\nBakiye : " +
        customer._balance.toString());
  }

  void update(Customer customer) {
    print("Müşteri güncellendi : " +
        customer._firstName +
        " " +
        customer._lastName +
        ";\nBakiye :  " +
        customer._balance.toString());
  }

  void delete(Customer customer) {
    print(
        "Müşteri silindi : " + customer._firstName + " " + customer._lastName);
  }
}
