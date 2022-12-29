import 'package:bismillahfinalproject/views/detail_product/components/detail_menu_widget.dart';
import 'package:bismillahfinalproject/views/detail_product/components/detail_product_components.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../view_models/cart_view_model.dart';
import '../../view_models/review_view_model.dart';

class DetailProductScreen extends StatefulWidget {
  final ProductDetailModel product;
  const DetailProductScreen({super.key, required this.product});

  @override
  State<DetailProductScreen> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartViewModel>(context, listen: false).resetQuantity();
    Future.microtask(
      () => Provider.of<ReviewViewModel>(context, listen: false)
          .fetchReviews(widget.product.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Detail Product",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 24.0,
            color: Colors.black,
          ),
        ),
        actions: [
          Stack(
            children: const [
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 8,
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailProductImage(product: widget.product),
            const SizedBox(height: 24),
            DetailInfoProduct(product: widget.product),
            const SizedBox(height: 24),
            DetailMenuProduct(product: widget.product),
            const SizedBox(height: 12),
            DetailMenuWidget(product: widget.product),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomDetailProduct(product: widget.product),
    );
  }
}
