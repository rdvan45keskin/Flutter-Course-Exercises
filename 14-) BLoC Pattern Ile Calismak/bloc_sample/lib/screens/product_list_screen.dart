import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:bloc_sample/blocs/product_bloc.dart';
import 'package:bloc_sample/models/cart.dart';
import 'package:bloc_sample/models/product.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ürünleri çekmek için fetchAllProducts'ı çağırıyoruz
    productBloc.fetchAllProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    //otomatik değişiyor
    return StreamBuilder<List<Product>>(
      initialData: [],
      stream: productBloc.getStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return buildProductListItems(snapshot);
        } else {
          return const Center(
            child: Text("Yükleniyor"),
          );
        }
      },
    );
  }

  buildProductListItems(AsyncSnapshot<List<Product>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list![index].productName),
            subtitle: Text(list[index].unitPrice.toString()),
            trailing: IconButton(
                onPressed: () {
                  cartBloc.addToCart(Cart(list[index], 1));
                },
                icon: const Icon(Icons.add_shopping_cart)),
          );
        });
  }
}
