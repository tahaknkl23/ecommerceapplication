import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductRiverpod extends ChangeNotifier {
  List<ProductModel> products = [];
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
    model.isFavorite = !model.isFavorite;
    notifyListeners();
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
