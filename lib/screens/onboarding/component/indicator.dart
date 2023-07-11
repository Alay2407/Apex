import 'package:flutter/material.dart';

Widget getIndicator(bool isActive) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 3.0),
    height: isActive ? 12 : 10,
    width: isActive ? 12 : 10,
    decoration: BoxDecoration(
      color: isActive ? Colors.amber : Colors.grey,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
