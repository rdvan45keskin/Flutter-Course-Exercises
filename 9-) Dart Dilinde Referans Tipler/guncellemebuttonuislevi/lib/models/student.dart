class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String _status;
  String imageUrl = "";
  //güncelleme için
  Student.withId(int _id, String _firstName, String _lastName, int _grade
      //,String _imageUrl
      ) {
    this.id = _id;
    this.firstName = _firstName;
    this.lastName = _lastName;
    this.grade = _grade;
    //this.imageUrl = _imageUrl;
  }
  //ekleme için
  Student(String _firstName, String _lastName, int _grade, String _imageUrl) {
    this.firstName = _firstName;
    this.lastName = _lastName;
    this.grade = _grade;
    this.imageUrl = _imageUrl;
  }

  Student.withoutInfo() {}

  String get getFirstName {
    return this.firstName;
  }

  void set setFirstName(String value) {
    //kurallar koyabiliriz ismi 10 harfli falan olmalı lazım gibi
    this.firstName = value;
  }

  //sadece okuyup sonuç döndürüyo
  //değişiklik yapılmıyor
  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti : ${this.grade}";
    } else if (this.grade >= 40) {
      message = "Bütünleme : ${this.grade}";
    } else {
      message = "Kaldı : ${this.grade}";
    }
    return message;
  }
}
