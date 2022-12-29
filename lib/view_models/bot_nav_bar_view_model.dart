import 'package:bismillahfinalproject/views/home/home_screen.dart';
import 'package:bismillahfinalproject/views/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';

import '../views/cart/cart_screen.dart';
import '../views/category/category_screen.dart';
import '../views/wishlist/wishlist_screen.dart';

class BotNavBarViewModel extends ChangeNotifier {
  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  List<Widget> get pages => _pages;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
