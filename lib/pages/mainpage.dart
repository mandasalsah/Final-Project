import 'package:bismillahfinalproject/pages/Profilepage.dart';
import 'package:bismillahfinalproject/pages/homepage.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List Pages = [
    HomePage(),
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
        selectedItemColor: Color(0xFFFF884B),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items:  [
           BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(label: "Doa",icon: Icon(Icons.bookmark)),
            BottomNavigationBarItem(label: "Kajian",icon: Icon(Icons.mosque)),
            BottomNavigationBarItem(label: "Profile",icon: Icon(Icons.account_circle)),
        ],
          ),
    );
  }
}
