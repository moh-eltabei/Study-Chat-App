// ignore_for_file: must_be_immutable

import 'package:chat_app/contants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key, required this.text, this.onTap, this.color = kPrimaryColor});

  String? text;
  VoidCallback? onTap;
  Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        margin: const EdgeInsets.only(
          left: 55,
          right: 55,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Text(
          text!.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    /* TextButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
        decoration: const BoxDecoration(
          color: Color(0xff3f7aff),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child:  Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
    ); */
    /* ElevatedButton(
      // onPressed: (() {}),
      child: Text(
        "Click Here",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: onTap,
      
      // color: Colors.red,
      
      // textColor: Colors.white,
      // padding: EdgeInsets.all(8.0),
      // splashColor: Colors.grey,
    ); */
  }
}
