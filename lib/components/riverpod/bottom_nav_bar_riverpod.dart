import 'package:e_commerce_application/view/basket/basket.dart';
import 'package:e_commerce_application/view/favorite/favorite.dart';
import 'package:e_commerce_application/view/home/home.dart';
import 'package:flutter/material.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Basket'),
  ];
  int currentIndex = 0;
  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners(); // bu fonksiyon değişiklik olduğunda dinleyicilere haber verir.
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Favorite();
      case 2:
        return const Basket();

      default:
        return const Home();
    }
  }
}
