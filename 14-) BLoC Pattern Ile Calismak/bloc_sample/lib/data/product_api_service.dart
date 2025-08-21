import 'dart:convert';

import 'package:bloc_sample/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApiService {
  static List<Product> products = [];

  static final ProductApiService _singleton = ProductApiService._internal();

  factory ProductApiService() {
    return _singleton;
  }

  //constructor
  ProductApiService._internal();

  static Future<List<Product>> getProducts() async {
    var url = Uri.parse("http://10.0.2.2:3000/products");
    var response = await http.get(url);
    // JSON verisini listeye çevirme
    List<dynamic> jsonList = jsonDecode(utf8.decode(response.bodyBytes));
    products = jsonList.map((json) => Product.fromJson(json)).toList();
    return products;
  }

  static List<Product> getAll() {
    return products;
  }
}
