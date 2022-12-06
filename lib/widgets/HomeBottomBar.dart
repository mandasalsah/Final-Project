import 'package:bismillahfinalproject/pages/CartPage.dart';
import 'package:bismillahfinalproject/pages/CategoryPage.dart';
import 'package:bismillahfinalproject/pages/HomePage.dart';
import 'package:bismillahfinalproject/pages/Profilepage.dart';
import 'package:bismillahfinalproject/pages/WishlistPage.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatefulWidget{
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  List Pages = [
    HomePage(),
    CategoryPage(),
    WishlistPage(),
    CartPage(),
    ProfilePage(),

  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF607EAA),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items:  [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Category",icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label: "Wishlist",icon: Icon(Icons.favorite)),
             BottomNavigationBarItem(label: "Cart",icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(label: "Profile",icon: Icon(Icons.person)),
        ],
          ),
    );
  }
}
