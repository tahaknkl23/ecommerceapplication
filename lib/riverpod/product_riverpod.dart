import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];
  List<ProductModel> basketProducts = [];
  double totalPrice = 0.0;

  final List<String> imagePaths = [
    "assets/images/one.png",
    "assets/images/two.png",
    "assets/images/three.png",
    "assets/images/four.png",
    "assets/images/five.png",
    "assets/images/six.png",
    "assets/images/seven.png",
  ];

  void setFavorite(ProductModel model) {
    if (model.isFavorite) {
      model.isFavorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFavorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void addedBasket(ProductModel model) {
    basketProducts.add(model);
    setTotalPrice(model);
    SnackBar(
      content: Text("${model.title} added to basket"),
      duration: const Duration(seconds: 1),
    );
  }

  void setTotalPrice(ProductModel model) {
    totalPrice += model.price;
  }

  void init() {
    for (int i = 0; i < 6; i++) {
      products.add(
        ProductModel(
          isFavorite: false,
          title: "Xiaomi ${i + 1}",
          description: "${8 + (i * 2)} MP kameralı ve 55${i * 10} mAh batarya",
          price: 6000.0 + (i * 10),
          imagePath: imagePaths[i],
        ),
      );
    }
  }
}
