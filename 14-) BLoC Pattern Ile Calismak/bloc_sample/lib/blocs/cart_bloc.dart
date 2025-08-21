import 'dart:async';

import 'package:bloc_sample/data/cart_service.dart';
import 'package:bloc_sample/models/cart.dart';

class CartBloc {
  final cartStreamController = StreamController.broadcast();

  //cartStreamController için getter yazıldı
  Stream get getStream => cartStreamController.stream;

  void addToCart(Cart item) {
    CartService.addToCart(item);
    //eklendikten sonra veriyi güncelleme
    cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCart(Cart item) {
    CartService.removeFromCart(item);
    //silindikten sonra veriyi güncelleme
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();
