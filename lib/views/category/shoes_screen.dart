import 'package:bismillahfinalproject/views/category/components/category_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/category_product_view_model.dart.dart';

class ShoesScreen extends StatefulWidget {
  const ShoesScreen({super.key});

  @override
  State<ShoesScreen> createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<CategoryProductViewModel>(context, listen: false)
          .fetchCategoryProduct("shoes"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shoes"),
        elevation: 0,
        backgroundColor: const Color(0xFF607EAA),
      ),
      backgroundColor: const Color(0xFF607EAA),
      body: const ListCategoryProduct(),
    );
  }
}
