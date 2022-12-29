import 'package:flutter/material.dart';

import '../../../../models/wishlist_model.dart';

class WishlistDetailProductImage extends StatelessWidget {
  final WishListProduct product;
  const WishlistDetailProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            product.image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
