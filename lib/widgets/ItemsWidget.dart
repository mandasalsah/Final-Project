import 'dart:ui';
import 'package:bismillahfinalproject/models/Product.dart';
import 'package:bismillahfinalproject/widgets/productviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsWidget extends StatefulWidget {
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  // void initState() {
  //   super.initState();

  //   Future.microtask(
  //     () => Provider.of<ProductViewModel>(context, listen: false)
  //         .fetchProductByCategoryName("k2"),
  //   );
  // }

  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, product, _) => Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: product.listProductByCategory.length,
            itemBuilder: (context, index) {
              final data = product.listProductByCategory[index];
              return _items(data, context);
            },
          ),
        ],
      ),
    );
  }

  Widget _items(ProductModel product, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Navigator.pushNamed(context, itemPage);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  product.img,
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                product.category.name,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp ${product.price}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  Icon(
                    Icons.add_shopping_cart,
                    size: 25,
                    color: Colors.lightBlue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
