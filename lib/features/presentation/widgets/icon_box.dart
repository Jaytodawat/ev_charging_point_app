import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  IconBox({super.key, required this.onPressed, required this.icon, this.boxColor, this.iconColor});
  void Function()? onPressed;
  IconData icon;
  Color? boxColor;
  Color? iconColor;


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.black, size: 20,),
        ),
      );
  }
}