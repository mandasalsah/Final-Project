import 'package:bismillahfinalproject/views/wishlist/components/wishlist_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/wishlist_view_model.dart';

class ListWishlistProduct extends StatelessWidget {
  const ListWishlistProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WishListViewModel>(
      builder: (context, wishlist, _) => SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: wishlist.wishListProduct.length < 12
                  ? wishlist.wishListProduct.length
                  : 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 16),
              itemBuilder: (context, index) {
                final data = wishlist.wishListProduct[index];
                return WishlistProduct(wishlist: data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
