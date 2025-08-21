import 'dart:async';

import 'package:bloc_sample/data/product_api_service.dart';
import 'package:bloc_sample/models/product.dart';

class ProductBloc {
  final StreamController<List<Product>> productStreamController =
      StreamController.broadcast();

  Stream<List<Product>> get getStream => productStreamController.stream;

  void fetchAllProducts() async {
    List<Product> products = await ProductApiService.getProducts();
    productStreamController.sink.add(products);
  }

  void dispose() {
    productStreamController.close();
  }
}

final productBloc = ProductBloc();
