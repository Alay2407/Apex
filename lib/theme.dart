import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(

      fontFamily: 'Mulish',
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.amber,
      elevatedButtonTheme: elevatedButtonTheme(),
      textButtonTheme: textButtonTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      appBarTheme: appBarTheme());
}

appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  );
}

inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: Colors.black45),
      gapPadding: 10);

  return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}

//text button theme
textButtonTheme() {
  return TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 16),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(Colors.amber.shade600),
    ),
  );
}

//elevated button theme
elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 30),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.pink),
        foregroundColor: MaterialStateProperty.all(Colors.white)),
  );
}
