
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({super.key, this.controller, required this.labelText, required this.obsecureText, this.icon});
  final String labelText;
  final bool obsecureText;
  final Icon? icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        style:  const TextStyle(
          color: Colors.black,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        obscureText: obsecureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          fillColor: kFaintWhite,
          filled: true,
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 13
          ),
        ),
      ),
    );
  }
}
//Color(0xFF1D1E33)