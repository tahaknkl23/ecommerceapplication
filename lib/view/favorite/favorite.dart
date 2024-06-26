import 'package:e_commerce_application/components/product_widget_item.dart';
import 'package:e_commerce_application/riverpod/riverpod_managament.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Favorite extends ConsumerWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    return Scaffold(
      body: product.favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You don't have any favorites yet", style: TextStyle(fontSize: 20, color: Colors.red)),
                  OutlinedButton(
                      onPressed: () {
                        ref.watch(bottomNavBarRiverpod).setCurrentIndex(0);
                      },
                      child: const Text("Go to Home", style: TextStyle(fontSize: 20, color: Colors.red)))
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Favorite",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: product.favorites.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(
                            model: product.favorites[index],
                            setFavorite: () => product.setFavorite(product.favorites[index]),
                            setBasket: () => product.addedBasket(product.favorites[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
