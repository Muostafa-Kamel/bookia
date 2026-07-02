import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../thems/app_colors.dart';

class ReusableTextFormF extends StatelessWidget {
  const ReusableTextFormF({
    super.key,
    required this.controller, required this.hint, required this.securedText,
  });

  final TextEditingController? controller;
  final String hint;
  final bool securedText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: securedText,
      controller: controller,
      decoration: InputDecoration(
        hint: Text(hint),
        hintStyle: TextStyle(color: Colors.grey),
        focusColor: AppColors.primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
