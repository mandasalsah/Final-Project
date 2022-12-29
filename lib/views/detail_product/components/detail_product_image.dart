import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class DetailProductImage extends StatelessWidget {
  final ProductDetailModel product;
  const DetailProductImage({super.key, required this.product});

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
