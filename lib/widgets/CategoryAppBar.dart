import 'package:flutter/material.dart';

class CategoryAppBar extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_outlined,
            size: 30,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Category",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            ),
        ],
      ),
    );
}
}