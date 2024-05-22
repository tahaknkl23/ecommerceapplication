import 'package:e_commerce_application/components/product_widget_item.dart';
import 'package:e_commerce_application/riverpod/riverpod_managament.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Basket extends ConsumerWidget {
  const Basket({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);

    return Scaffold(
      body: product.basketProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You don't have any basket yet", style: TextStyle(fontSize: 20, color: Colors.red)),
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
                        "Basket",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: product.basketProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(
                            model: product.basketProducts[index],
                            setFavorite: () => product.setFavorite(product.basketProducts[index]),
                            setBasket: () => product.addedBasket(product.basketProducts[index]),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price: ${product.totalPrice.toString()} ₺",
                          style: const TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ref.watch(bottomNavBarRiverpod).setCurrentIndex(2);
                          },
                          child: const Text("Complete Order"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
