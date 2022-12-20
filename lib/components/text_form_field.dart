// ignore_for_file: must_be_immutable

import 'package:chat_app/contants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, this.hintText, this.onChanged, this.obscureText = false});

  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText!.toUpperCase().trim(),
        hintStyle: TextStyle(
          color: Colors.grey[400],
          letterSpacing: 2,
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: kPrimaryColor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: kPrimaryColor,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
