import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo/data/api/category_api.dart';
import 'package:http_demo/data/api/product_api.dart';
import 'package:http_demo/models/category.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> categories = [];
  List<Widget> categoryWidgets = [];
  List<Product> products = [];

  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: categoryWidgets),
            ),
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  //kategorileri getirme operasyonu
  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((data) {
      setState(() {
        //json dosyasını dict formatına döndürüp iterable olarak ayarlama Liste oluyo
        Iterable list = json.decode(data.body);
        this.categories =
            //her gelen json formatını fromJson fonksiyonuyla dönüştürüp tek tek categories listesine eleman olarak atıyoz
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return TextButton(
      onPressed: () {
        getProductsByCategoryId(category);
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.lightGreenAccent),
        ),
      ),
      child: Text(
        category.categoryName,
        style: const TextStyle(
            fontSize: 16, color: Colors.black), // Yazı stili ve rengi
      ),
    );
  }

  //kategoriye göre getirme
  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((value) {
      setState(() {
        //utf-8 olarak dönüştürdük
        Iterable list = jsonDecode(utf8.decode(value.bodyBytes));
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  //tüm ürünleri getirme product
  void getProducts() {
    ProductApi.getProducts().then((value) {
      setState(() {
        //utf-8 olarak dönüştürdük
        Iterable list = jsonDecode(utf8.decode(value.bodyBytes));
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
