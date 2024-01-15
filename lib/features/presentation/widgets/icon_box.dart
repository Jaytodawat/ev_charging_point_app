import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({super.key, required this.onPressed, required this.icon, this.boxColor, this.iconColor});
  final void Function()? onPressed;
  final IconData icon;
  final Color? boxColor;
  final Color? iconColor;


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