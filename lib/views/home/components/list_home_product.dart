import 'package:bismillahfinalproject/view_models/product_view_model.dart';
import 'package:bismillahfinalproject/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListHomeProduct extends StatelessWidget {
  const ListHomeProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, product, _) => Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                product.products.length < 12 ? product.products.length : 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.3,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12),
            itemBuilder: (context, index) {
              final data = product.products[index];
              return ProductWidget(product: data);
            },
          ),
        ],
      ),
    );
  }
}
