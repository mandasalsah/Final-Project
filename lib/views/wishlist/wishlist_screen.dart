import 'package:bismillahfinalproject/views/wishlist/components/wishlist_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/wishlist_view_model.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<WishListViewModel>(context, listen: false)
          .fetchWishlistProduct(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Wishlist Screen",
          style: TextStyle(
            color: Color(0xFF607EAA),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16),
        child: ListWishlistProduct(),
      ),
    );
  }
}
