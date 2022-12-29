import 'package:bismillahfinalproject/utils/navigator/navigator.dart';
import 'package:bismillahfinalproject/views/search/search_screen.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Dahlia Shop",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const Spacer(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  NavigatorFadeTransitionHelper(
                    child: const SearchScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.search,
                size: 30,
                color: Color(0xFF607EAA),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.notifications,
            size: 30,
            color: Color(0xFF607EAA),
          ),
        ],
      ),
    );
  }
}
