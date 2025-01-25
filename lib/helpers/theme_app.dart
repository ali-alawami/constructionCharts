import 'package:flutter/material.dart';

class ThemeApp {
  static OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(width: 0.5, color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  static styleUnSelected({required color, required size}) {
    return TextStyle(
      fontFamily: 'Tajawal',
      color: color,
      fontSize: size,
    );
  }

  static styleSelected({required color, required size}) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Tajawal',
        color: color,
        fontSize: size);
  }

  static final List listColor = [
    const Color.fromARGB(255, 245, 205, 5),
    Colors.blue[200],
    Colors.red[800],
    Colors.amber[800],
    const Color.fromARGB(255, 106, 115, 168),
    const Color.fromARGB(255, 143, 66, 38),
    const Color.fromARGB(255, 78, 192, 126),
  ];
}
