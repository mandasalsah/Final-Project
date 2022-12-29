import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../models/wishlist_model.dart';
import '../../../../view_models/cart_view_model.dart';

class WishlistBottomDetailProduct extends StatelessWidget {
  final WishListProduct product;
  const WishlistBottomDetailProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93.85,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Consumer<CartViewModel>(
        builder: (context, checkout, _) => Row(
          children: [
            Container(
              height: 27.0,
              width: 88,
              decoration: const BoxDecoration(),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      checkout.minusQuantityProduct(product.stock);
                    },
                    child: Container(
                      width: 27.51,
                      height: 27.51,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(9.0),
                        ),
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xffC0C8C7),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 27.51,
                    height: 27.51,
                    child: Center(
                      child: Text(
                        checkout.quantityProduct.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      checkout.plusQuantityProduct(product.stock);
                    },
                    child: Container(
                      width: 27.51,
                      height: 27.51,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            9.0,
                          ),
                        ),
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xffC0C8C7),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 185.29,
              height: 50,
              child: Consumer<CartViewModel>(
                builder: (context, cart, _) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFB039),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(62), // <-- Radius
                    ),
                  ),
                  onPressed: () async {
                    try {
                      await cart
                          .postCart(
                              productId: product.id,
                              quantity: cart.quantityProduct)
                          .then(
                            (_) => Fluttertoast.showToast(
                                    msg: "Berhasil ditambahkan ke keranjang")
                                .then(
                              (_) => Navigator.pop(
                                context,
                              ),
                            ),
                          );
                    } catch (e) {
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  },
                  child: const Text("Add to cart"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
