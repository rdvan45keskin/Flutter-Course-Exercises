import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

// ignore: must_be_immutable
class ProductListRowWidget extends StatelessWidget {
  Product product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              height: 110.0,
              width: MediaQuery.of(context).size.width / 2,
              child: Image.asset("assets/sekiro_smiling.png"),
            ),
            SizedBox(height: 10),
            Text(
              product.productName,
              textAlign: TextAlign.center,
            ),
            Text(
              product.unitPrice.toString() + " TL",
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
