import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.titles,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textcolor,
  }) : super(key: key);

  final String titles;
  final IconData icon;
  // ignore: prefer_typing_uninitialized_variables
  final onPress;
  final bool endIcon;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xFFDBA39A).withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFDBA39A),
        ),
      ),
      title: Text(titles, style: Theme.of(context).textTheme.bodyText1),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFF607EAA).withOpacity(0.1)),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: Colors.blue,
              ))
          : null,
    );
  }
}
