import 'package:bismillahfinalproject/widgets/DealsWidget.dart';
import 'package:bismillahfinalproject/widgets/HomeAppBar.dart';
import 'package:bismillahfinalproject/widgets/HomeBottomBar.dart';
import 'package:bismillahfinalproject/widgets/ItemsWidget.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        HomeAppBar(),
        Container(
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Color(0xFF607EAA),
          ),
          child: Column(children: [
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
                  color: Color(0xFFF9F5EB),
                ),
              ),
            ),
            DealsWidget(),
            SizedBox(height: 5,),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                "Hot Sales",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF9F5EB),
                ),
              ),
            ),
            ItemsWidget(),
          ],
          ),
        )
      ],
      ),
    );
}
}
