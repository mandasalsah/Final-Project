import 'package:bismillahfinalproject/widgets/HomeAppBar.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        HomeAppBar(),
        Container(
          child: Text("INI CONFLICT"),
        ),
        Container(
          child: Text("ini juga conflict"),
        ),
        Container(
          child: Text("mau conflict lagi"),
        ),
        Container(
          child: Text("mau conflict lagi"),
        ),
      ],
    ));
  }
}
