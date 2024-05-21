import 'package:e_commerce_application/riverpod/riverpod_managament.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Products",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: read.products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(watch.products[index].imagePath),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
