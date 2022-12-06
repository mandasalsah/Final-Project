import 'package:bismillahfinalproject/widgets/DealsWidget.dart';
import 'package:bismillahfinalproject/widgets/HomeAppBar.dart';
import 'package:bismillahfinalproject/widgets/HomeBottomBar.dart';
import 'package:bismillahfinalproject/widgets/ItemsWidget.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Product.dart';
import '../widgets/ProductViewModel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 27,
                              color: Colors.blueAccent,
                            ),
                            hintText: "Search Here",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 10, bottom: 5),
                  child: Text(
                    "Best Deal",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                DealsWidget(),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    "Hot Sales",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ),
                _listOfItems(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listOfItems() {
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
