import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqlite_demo/data/dbHelper.dart';
import 'package:sqlite_demo/models/product.dart';

class ProductDetail extends StatefulWidget {
  //constructor
  Product product;
  ProductDetail(this.product);

  @override
  State<ProductDetail> createState() => _ProductDetailState(product);
}

//sabitler silme veya güncelleme
enum Options { delete, update }

class _ProductDetailState extends State<ProductDetail> {
  //constructor
  Product product;
  _ProductDetailState(this.product);

  var dbHelper = Dbhelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();

  @override
  void initState() {
    txtName.text = product.name;
    txtDescription.text = product.description;
    txtUnitPrice.text = product.unitPrice.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        centerTitle: true,
        title: Text(
          "Ürün Detayı : ${product.name}",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              PopupMenuItem<Options>(
                value: Options.delete,
                child: Text("Sil"),
              ),
              PopupMenuItem<Options>(
                value: Options.update,
                child: Text("Güncelle"),
              )
            ],
          )
        ],
      ),
      body: buildProductDetail(),
    );
  }

  buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          buildTextField("Ürün adı", txtName),
          buildTextField("Ürün Açıklaması", txtDescription),
          buildTextField("Ürün Fiyatı", txtUnitPrice),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(labelText: labelText),
      controller: controller,
    );
  }

  //gönderilen değeri alıyo
  void selectProcess(Options value) async {
    //silme işlemi
    if (value == Options.delete) {
      if (product.id != null) {
        await dbHelper.delete(product.id!);
        Navigator.pop(context, true);
      } else {
        // Hata veya uygun bir işlem
        print("Product ID is null");
        Navigator.pop(context, false);
      }
    }
    //güncelleme işlemi
    else if (value == Options.update) {
    if (product.id != null) {
      await dbHelper.update(Product.withId(
          id: product.id,
          name: txtName.text,
          description: txtDescription.text,
          unitPrice: double.tryParse(txtUnitPrice.text)));
      Navigator.pop(context, true);
    } else {
      // Hata veya uygun bir işlem
      print("Product ID is null");
      Navigator.pop(context, false);
    }
    }
  }
}
