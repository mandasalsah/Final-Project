import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/cart_view_model.dart';

class PriceCartProduct extends StatelessWidget {
  const PriceCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, cart, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "Rp ${cart.sumPriceProducts}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
