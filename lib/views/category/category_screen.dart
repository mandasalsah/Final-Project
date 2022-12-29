import 'package:bismillahfinalproject/views/category/fashion_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'headphone_screen.dart';
import 'shoes_screen.dart';
import 'watch_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Screen"),
        backgroundColor: const Color(0xFF607EAA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  NavigatorFadeTransitionHelper(
                    child: const FashionScreen(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: Image.network(
                    'https://i.ytimg.com/vi/lkDT_wwUcCo/hqdefault.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  NavigatorFadeTransitionHelper(
                    child: const WatchScreen(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: Image.network(
                    'https://thumbs.dreamstime.com/z/word-watch-spelled-dice-spelling-using-wooden-white-background-135893568.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  NavigatorFadeTransitionHelper(
                    child: const HeadphoneScreen(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: Image.network(
                    'https://i.pinimg.com/originals/89/8b/24/898b24d898b15cc7a61d666fbe028168.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  NavigatorFadeTransitionHelper(
                    child: const ShoesScreen(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: Image.network(
                    'https://i.pinimg.com/736x/ee/bb/12/eebb125eafe602ce928691bb80e019af.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
