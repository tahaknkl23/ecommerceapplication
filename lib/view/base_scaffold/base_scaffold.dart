import 'package:e_commerce_application/components/bottom_nav_bar.dart';
import 'package:e_commerce_application/riverpod_managament.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseScaffold extends ConsumerWidget {
  const BaseScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: watch.body(),
    );
  }
}
