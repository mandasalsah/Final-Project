import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import 'components/search_components.dart';
import 'search_screen.dart';

class ResultSearchScreen extends StatelessWidget {
  const ResultSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
        ),
        title: const Text(
          "Search",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        elevation: 0.3,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 32),
            SearchField(
              readOnly: true,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  NavigatorFadeTransitionHelper(
                    child: const SearchScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            const ListResultProduct(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
