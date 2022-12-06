import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Detail Doa"),
      ),
      body: Center(child: Text("Detail Doa Page #$index"),
      ),
    );
  }
}