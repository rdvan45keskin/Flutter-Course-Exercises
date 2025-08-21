import 'package:flutter/material.dart';
import 'package:sqlite_demo/data/dbHelper.dart';
import 'package:sqlite_demo/models/product.dart';
import 'package:sqlite_demo/screens/product_add.dart';
import 'package:sqlite_demo/screens/product_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  //DbHelper dbhelper = new Dbhelper();
  var dbhelper = Dbhelper();
  late List<Product> products;
  int productCount = 0;

  //sayfa açıldığında uygulanacak şeyler
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        centerTitle: true,
        title: Text(
          "Ürün Listesi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToProductAdd();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni ürün ekle",
      ),
    );
  }

  ListView buildProductList() {
    //değerleri sıralama
    return ListView.builder(
        //belirtilen değer
        itemCount: productCount,
        //belirtiilen değer kadar eleman dönmeye yarıyo
        itemBuilder: (BuildContext context, int i) {
          return Card(
            color: Colors.indigo[300],
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text("P"),
              ),
              title: Text(products[i].name),
              subtitle: Text(products[i].description),
              onTap: () {
                goToDetail(this.products[i]);
              },
            ),
          );
        });
  }

  void goToProductAdd() async {
    bool? result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductAdd()));
    //ekleme yapılmışsa
    if (result != null) {
      //ürün başarıyla eklendiyse
      if (result) {
        //ürünleri getir
        getProducts();
      }
    }
  }

  //ürünleri getirme fonksiyonu
  void getProducts() async {
    var productsFuture = dbhelper.getProducts();
    //data geldiği zaman
    //data return edilen veriler demek
    productsFuture.then((data) {
      //gelen veriyi listeye verme
      setState(() {
        this.products = data; // Listeyi güncelle
        productCount = data.length; // Ürün sayısını güncelle
      });
    });
  }

  //ürünü detaylı gösterme fonksiyonu
  void goToDetail(Product product) async {
    bool? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetail(product)));
    //if (result != null) {
    if (result == true) {
      getProducts();
    }
    //}
  }
}
