import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_application/model/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel model;
  final Function setFavorite;
  final Function setBasket;
  const ProductWidget({
    super.key,
    required this.model,
    required this.setFavorite,
    required this.setBasket,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  model.imagePath,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      model.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      model.description,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${model.price.toString()} ₺",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 125,
                      child: ElevatedButton.icon(
                        onPressed: () => setBasket(),
                        icon: const Icon(
                          Icons.shopping_bag,
                          color: Colors.red,
                        ),
                        label: const Text(
                          "Add to Basket",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () => setFavorite(),
                icon: Icon(model.isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
                color: model.isFavorite ? Colors.red : Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
