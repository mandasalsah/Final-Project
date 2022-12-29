import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/cart_view_model.dart';

class QuantityCartProduct extends StatelessWidget {
  const QuantityCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, cart, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Products",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff888888),
              ),
            ),
            Text(
              cart.carts.length.toString(),
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff888888),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
