import 'package:bismillahfinalproject/views/checkout/checkout_screen.dart';
import 'package:bismillahfinalproject/views/search/search_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../view_models/cart_view_model.dart';
import '../../view_models/transaction_view_model.dart';
import '../../view_models/user_view_model.dart';
import '../../widgets/button_widget.dart';
import 'components/cart_components.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartPageState();
}

class _CartPageState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<CartViewModel>(context, listen: false).fetchCart());
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Your Cart",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<CartViewModel>(
        builder: (context, cart, _) {
          if (cart.appState == AppState.loaded) {
            return _hasDataCart();
          }
          if (cart.appState == AppState.noData) {
            return _noDataCart(width);
          }
          return _hasDataCart();
        },
      ),
    );
  }

  Widget _hasDataCart() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListCart(),
          const SizedBox(height: 40),
          const QuantityCartProduct(),
          const SizedBox(height: 16),
          const PriceCartProduct(),
          const SizedBox(height: 30),
          Consumer<UserViewModel>(
            builder: (context, user, _) => Consumer<TransactionViewModel>(
              builder: (context, transaction, _) => ButtonWidget(
                  color: const Color(0xff607EAA),
                  buttonText: 'CHECKOUT',
                  height: 50,
                  width: 300,
                  onpressed: () async {
                    Navigator.of(context).push(
                      NavigatorFadeTransitionHelper(
                        child: const CheckoutScreen(),
                      ),
                    );
                  },
                  radius: 10,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _noDataCart(double width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 110,
                width: width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        "assets/images/empty_cart_image.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Text(
                            "Wah, keranjang belanjamu kosong",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Yuk, isi dengan barang-barang impianmu!",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                  color: const Color(0xff607EAA),
                  buttonText: "Mulai Belanja",
                  height: 35,
                  width: width,
                  onpressed: () async {
                    Navigator.of(context).push(
                      NavigatorFadeTransitionHelper(
                        child: const SearchScreen(),
                      ),
                    );
                  },
                  radius: 10,
                  fontSize: 14),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
