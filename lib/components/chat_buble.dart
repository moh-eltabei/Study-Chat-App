// ignore_for_file: camel_case_types

import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

import '../contants.dart';

class chatBuble extends StatelessWidget {
  const chatBuble({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 12, left: 16),
        decoration: const BoxDecoration(
          color: kSecondryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: Colors.white, height: 1),
        ),
      ),
    );
  }
}

class chatBubleForFrinds extends StatelessWidget {
  const chatBubleForFrinds({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 12, right: 16),
        decoration: const BoxDecoration(
          color: Color(0xffebebeb),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(14),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(color: Colors.black, height: 1),
        ),
      ),
    );
  }
}
