import 'package:ev_charging_point_app/features/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchField extends StatelessWidget {
  final void Function(String) onSubmit;

  const SearchField({super.key, required this.onSubmit});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          focusedBorder: InputBorder.none,
          hintText: "Location, Charging Station",
          prefixIcon: const Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(9)),
        ),
        onSubmitted: onSubmit,
      ),
    );
  }
}