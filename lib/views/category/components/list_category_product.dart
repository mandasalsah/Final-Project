import 'package:bismillahfinalproject/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/category_product_view_model.dart.dart';

class ListCategoryProduct extends StatelessWidget {
  const ListCategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProductViewModel>(
      builder: (context, category, _) => Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                category.products.length < 12 ? category.products.length : 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.3,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12),
            itemBuilder: (context, index) {
              final data = category.products[index];
              return ProductWidget(product: data);
            },
          ),
        ],
      ),
    );
  }
}
