import 'package:bismillahfinalproject/view_models/cart_view_model.dart';
import 'package:bismillahfinalproject/view_models/checkout_view_model.dart';
import 'package:bismillahfinalproject/views/checkout/components/modal_update_address.dart';
import 'package:bismillahfinalproject/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../view_models/transaction_view_model.dart';
import 'success_checkout_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff6F8AB1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              _shippingAddress(),
              const SizedBox(height: 32),
              _summaryItem(),
              const SizedBox(height: 32),
              _summaryOrder(),
              const SizedBox(height: 32),
              _totalPayment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shippingAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Shipping Address",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Container(
            height: 95,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: const Color(0xffEAE3D2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<CheckoutViewModel>(
                builder: (context, checkout, _) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      checkout.alamat.isEmpty
                          ? "Alamat kosong"
                          : checkout.alamat,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        _updateAddress(context);
                      },
                      child: const Text(
                        "Change Address",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff607EAA),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _summaryItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Summary Item",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: const Color(0xffEAE3D2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<CartViewModel>(
                builder: (context, cart, _) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    cart.carts[index].cartProduct.image),
                                fit: BoxFit.fill),
                          ),
                        ),
                        title: Text(cart.carts[index].cartProduct.name),
                        subtitle: Text(
                          "Rp.${cart.carts[index].cartProduct.harga}",
                          style: const TextStyle(
                              color: Color(0xff6F8AB1),
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "Quantity ${cart.carts[index].quantity}",
                          style: const TextStyle(color: Color(0xffB3B3B3)),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: cart.carts.length),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _summaryOrder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Summary Order",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: const Color(0xffEAE3D2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 16),
              child: Consumer<CartViewModel>(
                builder: (context, cart, _) => Column(
                  children: [
                    Container(
                      height: 35,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xffC9C4B9), width: 2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Delivery Fee",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          Text(
                            "Rp 0",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xffC9C4B9), width: 2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Subtotal",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Text(
                            cart.sumPriceProducts.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Text(
                            cart.sumPriceProducts.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _totalPayment() {
    return Container(
      height: 95,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Color(0xffEAE3D2),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 36, right: 36, top: 24, bottom: 24),
        child: Consumer<CartViewModel>(
          builder: (context, cart, _) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Total Payment",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    "Rp ${cart.sumPriceProducts.toString()}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ],
              ),
              Consumer<CheckoutViewModel>(
                builder: (context, checkout, _) =>
                    Consumer<TransactionViewModel>(
                  builder: (context, transaction, _) => ButtonWidget(
                      buttonText: "CONTINUE",
                      height: 55,
                      width: 150,
                      onpressed: () async {
                        if (checkout.alamat.isEmpty) {
                          return Fluttertoast.showToast(
                              msg: "Isi alamat terlebih dahulu");
                        }
                        try {
                          await transaction
                              .postTransaction(checkout.alamat)
                              .then((_) => Fluttertoast.showToast(
                                  msg: "Berhasil checkout product"))
                              .then(
                                (_) => Navigator.of(context).pushReplacement(
                                  NavigatorFadeTransitionHelper(
                                    child: const SuccessCheckoutScreen(),
                                  ),
                                ),
                              );
                        } catch (e) {
                          Fluttertoast.showToast(msg: e.toString());
                        }
                      },
                      radius: 15,
                      fontSize: 16,
                      color: const Color(0xff607EAA)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateAddress(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, _, __) {
        return const Align(
          alignment: Alignment.bottomCenter,
          child: ModalUpdateAddress(),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }
}
