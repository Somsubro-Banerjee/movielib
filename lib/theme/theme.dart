import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(
        color: Colors.green,
        centerTitle: true,
        textTheme: TextTheme(
            headline6: TextStyle(
          color: Colors.black,
          fontSize: 22,
        )),
        elevation: 0,
      ),
      textTheme: TextTheme(
          subtitle1: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          subtitle2: TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
          bodyText2: TextStyle(fontSize: 13)),
      iconTheme: IconThemeData(size: 22, color: Colors.white),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green, foregroundColor: Colors.black),
      dividerColor: Colors.black54,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        primary: Colors.black,
      )),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))));
}
