import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final Function onpressed;
  final double radius;
  final double fontSize;
  final Color color;

  const ButtonWidget(
      {super.key,
      required this.buttonText,
      required this.height,
      required this.width,
      required this.onpressed,
      required this.radius,
      required this.fontSize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
        onPressed: () {
          onpressed();
        },
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
              color: color),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
