import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget{
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
              "Dahlia Shop",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1C3879),
              ),
            ),
            ),
            Spacer(),
            Icon(
              Icons.notifications,
              size: 30,
              color: Color(0xFF607EAA) ,
            ),
        ],
      ),
    );
}
}