import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/search_view_model.dart';
import '../../../widgets/product_widget.dart';

class ListResultProduct extends StatelessWidget {
  const ListResultProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Consumer<SearchProductViewModel>(
        builder: (context, search, _) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: search.searchResult.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.5,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              final data = search.searchResult[index];
              return ProductWidget(product: data);
            },
          );
        },
      ),
    );
  }
}
