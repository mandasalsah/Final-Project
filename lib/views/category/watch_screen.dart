import 'package:bismillahfinalproject/views/category/components/category_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/category_product_view_model.dart.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<CategoryProductViewModel>(context, listen: false)
          .fetchCategoryProduct("watch"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watch"),
        elevation: 0,
        backgroundColor: const Color(0xFF607EAA),
      ),
      backgroundColor: const Color(0xFF607EAA),
      body: const ListCategoryProduct(),
    );
  }
}
