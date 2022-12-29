import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/bot_nav_bar_view_model.dart';
import '../../view_models/user_view_model.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () {
        Provider.of<UserViewModel>(context, listen: false).addUserDetail();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BotNavBarViewModel>(
        builder: (context, navbar, _) => Center(
          child: navbar.pages[navbar.selectedIndex],
        ),
      ),
      bottomNavigationBar: Consumer<BotNavBarViewModel>(
        builder: (context, navbar, _) => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Category",
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              label: "Wishlist",
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
          selectedFontSize: 16,
          elevation: 0,
          iconSize: 24,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: navbar.selectedIndex,
          selectedItemColor: const Color(0xFF607EAA),
          selectedLabelStyle: const TextStyle(
            color: Color(0xFF607EAA),
          ),
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          unselectedLabelStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5),
          ),
          unselectedFontSize: 16,
          onTap: navbar.changeIndex,
        ),
      ),
    );
  }
}
