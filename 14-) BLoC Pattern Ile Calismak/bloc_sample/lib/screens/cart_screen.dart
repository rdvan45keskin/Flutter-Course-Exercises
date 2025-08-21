import 'package:bloc_sample/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepet"),
      ),
      body: buildCartList(),
    );
  }

  Widget buildCartList() {
    return StreamBuilder(
        initialData: cartBloc.getCart(),
        stream: cartBloc.getStream,
        //snapshot streambuilder ile kullanılıyor
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: buildCartItems(snapshot),
                ),
                buildTotalPrice(snapshot)
              ],
            );
          } else {
            return const Center(
              child: Text("Sepet Boş"),
            );
          }
        });
  }

  Widget buildCartItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final cart = snapshot.data;
          return ListTile(
            title: Text("${cart[index].product.productName}"),
            subtitle: Text(cart[index].product.unitPrice.toString()),
            trailing: IconButton(
                onPressed: () {
                  cartBloc.removeFromCart(cart[index]);
                },
                icon: const Icon(Icons.remove_shopping_cart)),
          );
        });
  }

  //toplam fiyatı yazdırma
  Widget buildTotalPrice(AsyncSnapshot snapshot) {
    // Toplam fiyatı hesaplamak için tüm sepet öğelerinin fiyatlarını topluyoruz
    double totalPrice = calculateTotalPrice(snapshot.data);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Toplam Fiyat:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "${totalPrice.toStringAsFixed(2)} TL",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //fiyat toplama fonksiyonu
  double calculateTotalPrice(data) {
    double totalPrice = 0;
    for (var i in data) {
      totalPrice += i.product.unitPrice * i.quantity;
    }
    return totalPrice;
  }
}
