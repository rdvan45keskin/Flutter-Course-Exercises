import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_row_widget.dart';

//statefullWidgetin özelliklerini almasını sağladık böylece sürekli ekranı kendi kendine güncelleyen bir widget gibi davranacak
// ignore: must_be_immutable
class ProductListWidget extends StatefulWidget {
  List<Product> products = [];

  ProductListWidget(this.products);

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 500,
          //ızraga biçiminde bölüyo
          child: GridView.count(
            //her satırda 2 tane olacak şekilde ayırıyor
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (i) {
              return ProductListRowWidget(widget.products[i]);
            }),
          ),
        ),
      ],
    );
  }
}
