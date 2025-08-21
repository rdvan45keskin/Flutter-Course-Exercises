import 'package:flutter/material.dart';
import 'package:sqlite_demo/data/dbHelper.dart';
import 'package:sqlite_demo/models/product.dart';
import 'package:sqlite_demo/validation/product_validator.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  //dbHelper nesnesi oluşturma
  var dbHelper = Dbhelper();
  final validator = ProductValidator();
  //her değer için TextEditingController oluşturma yani girilen değeri alma

  final _productFormKey = GlobalKey<FormState>();

  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[500],
          centerTitle: true,
          title: Text(
            "Yeni Ürün Ekle",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Form(
          key: _productFormKey,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                buildTextField(
                    "Ürün adı", txtName, validator.validateProductName),
                buildTextField("Ürün Açıklaması", txtDescription,
                    validator.validateProductDescription),
                buildTextField("Ürün Fiyatı", txtUnitPrice,
                    validator.validateProductUnitPrice),
                buildSaveButton()
              ],
            ),
          ),
        ));
  }

  //text field oluşturma fonksiyonu
  Widget buildTextField(String labelText, TextEditingController controller,
      String? Function(String?)? validator) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
      controller: controller,
    );
  }

  buildSaveButton() {
    return FloatingActionButton(
        onPressed: () {
          final form = _productFormKey.currentState;
          if (form != null && form.validate()) {
            // Formu doğrula
            addProduct();
          }
        },
        child: Text("Ekle"));
  }

  void addProduct() async {
    var result = await dbHelper.insert(Product(
        name: txtName.text,
        description: txtDescription.text,
        unitPrice: double.tryParse(txtUnitPrice.text)));
    Navigator.pop(context, true);
  }
}
