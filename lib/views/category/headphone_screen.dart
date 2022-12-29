import 'package:bismillahfinalproject/views/category/components/category_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/category_product_view_model.dart.dart';

class HeadphoneScreen extends StatefulWidget {
  const HeadphoneScreen({super.key});

  @override
  State<HeadphoneScreen> createState() => _HeadphoneScreenState();
}

class _HeadphoneScreenState extends State<HeadphoneScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<CategoryProductViewModel>(context, listen: false)
          .fetchCategoryProduct("headphones"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Headphone"),
        elevation: 0,
        backgroundColor: const Color(0xFF607EAA),
      ),
      backgroundColor: const Color(0xFF607EAA),
      body: const ListCategoryProduct(),
    );
  }
}
