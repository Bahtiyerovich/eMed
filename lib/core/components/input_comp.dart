import 'package:flutter/material.dart';

class InputComp {
  static inputDecoration({
    required String hintText,
     IconButton? suffixIcon,
  }) =>
      InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      );
}
