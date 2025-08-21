mixin class StudentValidationMixin {
  // burda doğrulamalar var
  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "İsim boş bırakılamaz";
    } else if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır";
    }
    return null; // Eğer hata yoksa null döndür
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "İsim boş bırakılamaz";
    } else if (value.length < 2) {
      return "Soyisim en az iki karakter olmalıdır";
    }
    return null; // Eğer hata yoksa null döndür
  }

  String? validateGrade(String? value) {
    var grade = int.parse(value!);
    if (grade == null || value.isEmpty) {
      return "İsim boş bırakılamaz";
    } else if (grade < 0 || grade > 100) {
      return "Not 0 - 100 arasında olmalıdır";
    }
    return null; // Eğer hata yoksa null döndür
  }
}
