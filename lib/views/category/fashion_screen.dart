import 'package:bismillahfinalproject/views/category/components/category_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/category_product_view_model.dart.dart';

class FashionScreen extends StatefulWidget {
  const FashionScreen({super.key});

  @override
  State<FashionScreen> createState() => _FashionScreenState();
}

class _FashionScreenState extends State<FashionScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<CategoryProductViewModel>(context, listen: false)
          .fetchCategoryProduct("fashion"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fashion"),
        elevation: 0,
        backgroundColor: const Color(0xFF607EAA),
      ),
      backgroundColor: const Color(0xFF607EAA),
      body: const ListCategoryProduct(),
    );
  }
}
