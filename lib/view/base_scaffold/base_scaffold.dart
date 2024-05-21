import 'package:e_commerce_application/components/bottom_nav_bar.dart';
import 'package:e_commerce_application/components/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:e_commerce_application/riverpod/riverpod_managament.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  void initState() {
    ref.read(productRiverpod).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: watch.body(),
      appBar: appbarBuild(watch),
    );
  }

  AppBar appbarBuild(BottomNavBarRiverpod watch) {
    return AppBar(
      title: Text(
        watch.appBarTtile,
      ),
      centerTitle: true,
    );
  }
}
