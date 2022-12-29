import 'package:bismillahfinalproject/views/detail_product/detail_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../utils/utils.dart';
import '../view_models/cart_view_model.dart';
import '../view_models/wishlist_view_model.dart';

class ProductWidget extends StatefulWidget {
  final ProductDetailModel product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          NavigatorFadeTransitionHelper(
            child: DetailProductScreen(product: widget.product),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.product.image),
                      fit: BoxFit.fill),
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Text(
                            "Rp.${widget.product.harga}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _modalAction(context, width);
                              },
                              child: const Icon(Icons.more_vert),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _modalAction(BuildContext context, double width) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey[50],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 72,
                      width: width,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xffEDEDED), width: 2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Product Action",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.close,
                                      size: 25, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Consumer<WishListViewModel>(
                          builder: (context, wishlist, _) => _containerAction(
                              nameAction: 'Add To Wishlist',
                              function: () async {
                                try {
                                  await wishlist
                                      .postWishList(
                                        idBarang: widget.product.id,
                                      )
                                      .then(
                                        (_) => Fluttertoast.showToast(
                                            msg:
                                                'Berhasil ditambahkan ke wishlist'),
                                      )
                                      .then(
                                        (_) => Navigator.pop(context),
                                      );
                                } catch (e) {
                                  Fluttertoast.showToast(msg: e.toString());
                                  Navigator.pop(context);
                                }
                              },
                              width: width),
                        ),
                        Consumer<CartViewModel>(
                          builder: (context, cart, _) => _containerAction(
                              nameAction: 'Add To Cart',
                              function: () async {
                                try {
                                  await cart
                                      .postCart(
                                          productId: widget.product.id,
                                          quantity: 1)
                                      .then(
                                        (_) => Fluttertoast.showToast(
                                                msg:
                                                    "Berhasil menambahkan produk ke keranjang")
                                            .then(
                                          (_) => Navigator.pop(context),
                                        ),
                                      );
                                } catch (e) {
                                  Fluttertoast.showToast(msg: e.toString());
                                }
                              },
                              width: width),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _containerAction(
      {required String nameAction,
      required void Function() function,
      required double width}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 16),
          child: Container(
            alignment: Alignment.centerLeft,
            height: 60,
            width: width,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xffEDEDED), width: 2),
              ),
            ),
            child: Text(
              nameAction,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
