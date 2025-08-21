class Category {
  late int id;
  late String categoryName;
  late String seoUrl;

  // Constructor
  Category(this.id, this.categoryName, this.seoUrl);

  // JSON'dan Category nesnesine çevirme
  Category.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json["id"].toString()) ??
        0; // string veya int gelsin, güvenli parse
    categoryName = json["categoryName"].toString();
    seoUrl = json["seoUrl"].toString();
  }

  // Category nesnesini JSON'a çevirme
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryName": categoryName,
      "seoUrl": seoUrl,
    };
  }
}
