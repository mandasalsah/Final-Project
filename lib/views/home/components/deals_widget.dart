import 'package:flutter/material.dart';

class DealsWidget extends StatelessWidget {
  const DealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 4; i++)
            Image.asset(
              "images/deal$i.jpg",
              height: 220,
              width: 300,
              fit: BoxFit.cover,
            )
        ],
      ),
    );
  }
}
