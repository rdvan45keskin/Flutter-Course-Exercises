class ProductValidator {
  String? validateProductName(String? value) {
    if (value == null || value.isEmpty) {
      return "İsim boş bırakılamaz";
    } else if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır";
    }
    return null; // Eğer hata yoksa null döndür
  }

  String? validateProductDescription(String? value) {
    if (value == null || value.isEmpty) {
      return "Açıklama Boş Bırakılamaz";
    } else if (value.length < 6) {
      return "Açıklama en az 6 karakter olmalıdır";
    }
    return null; // Eğer hata yoksa null döndür
  }

  String? validateProductUnitPrice(String? value) {
    if (value == null || value.isEmpty) {
      return "Fiyat kısmı boş bırakılamaz";
    }
    var unitPrice = double.tryParse(value);
    if (unitPrice == null || unitPrice < 0) {
      return "Fiyat 0'dan fazla olmalıdır";
    }
    return null; // Eğer hata yoksa null döndür
  }
}
