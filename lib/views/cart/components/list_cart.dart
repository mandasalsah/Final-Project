import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../utils/utils.dart';
import '../../../view_models/cart_view_model.dart';
import '../../../widgets/skeleton_container.dart';

class ListCart extends StatelessWidget {
  const ListCart({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Consumer<CartViewModel>(
        builder: (context, cart, _) {
          if (cart.appState == AppState.loaded) {
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = cart.carts[index];

                  return Container(
                    width: width,
                    height: 115,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.3), width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: _cartImage(data.cartProduct.image),
                          ),
                          Expanded(
                            flex: 3,
                            child: _cartDetailProduct(
                                nameProduct: data.cartProduct.name,
                                price: data.cartProduct.harga,
                                quantity: data.quantity),
                          ),
                          Expanded(
                            flex: 1,
                            child: _deleteCart(data.id),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemCount: cart.carts.length);
          }
          return _loadingContainer(width);
        },
      ),
    );
  }

  Widget _loadingContainer(double width) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) =>
          SkeletonContainer(width: width, height: 115, borderRadius: 10),
    );
  }

  Widget _deleteCart(int productId) {
    return SizedBox(
      width: 30,
      height: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: Colors.transparent,
          child: Consumer<CartViewModel>(
            builder: (context, cart, _) => InkWell(
              onTap: () async {
                try {
                  await cart.deleteCart(productId).then(
                        (_) => Fluttertoast.showToast(
                            msg: "Item ini berhasil dihapus dari keranjang"),
                      );
                } catch (e) {
                  Fluttertoast.showToast(msg: e.toString());
                }
              },
              child: const Icon(Icons.delete, color: Colors.grey, size: 24),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cartDetailProduct(
      {required String nameProduct,
      required int price,
      required int quantity}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameProduct,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Rp ${price * quantity}",
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Consumer<CartViewModel>(
            builder: (context, cart, _) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "Quantity : $quantity",
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartImage(String urlImage) {
    return Image.network(
      urlImage,
      fit: BoxFit.fill,
    );
  }
}
