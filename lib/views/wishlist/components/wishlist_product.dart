import 'package:bismillahfinalproject/models/wishlist_model.dart';
import 'package:bismillahfinalproject/utils/navigator/navigator.dart';
import 'package:bismillahfinalproject/views/detail_product/detail_product_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../view_models/cart_view_model.dart';
import '../../../view_models/wishlist_view_model.dart';

class WishlistProduct extends StatefulWidget {
  final WishListModel wishlist;
  const WishlistProduct({super.key, required this.wishlist});

  @override
  State<WishlistProduct> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<WishlistProduct> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final data = widget.wishlist.product;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          NavigatorFadeTransitionHelper(
            child:
                DetailProductWishlistScreen(product: widget.wishlist.product),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF607EAA),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data.image), fit: BoxFit.fill),
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Rp.${data.harga}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _modalAction(context, width);
                          },
                          child: const Icon(Icons.more_vert,
                              size: 22, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
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
                              nameAction: 'Delete Wishlist',
                              function: () async {
                                try {
                                  await wishlist
                                      .deleteWishList(widget.wishlist.id)
                                      .then(
                                        (_) => Fluttertoast.showToast(
                                            msg:
                                                'Berhasil dihapus dari wishlist'),
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
                                          productId: widget.wishlist.product.id,
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
