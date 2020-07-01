import 'package:flutter/material.dart';
ThemeData appTheme() {
  final ThemeData base =ThemeData.dark();
  return base.copyWith(
      primaryColor: Color(0xFF42A5F5),
      textTheme: _appTextTheme(base.textTheme),
    scaffoldBackgroundColor: Colors.white,



  );
}

TextTheme _appTextTheme(TextTheme base){
  final bodyText1Theme =base.bodyText1.copyWith(
          fontSize: 20,
          color: Colors.blueGrey[700],
          fontWeight: FontWeight.w500
  );
  final buttonTheme = base.button.copyWith(
    letterSpacing: 6
  );
  return base.copyWith(
    bodyText1: bodyText1Theme,
    button: buttonTheme,
  );
}



