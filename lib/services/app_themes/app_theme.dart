import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_ui/constants/constants.dart';
import 'package:sizer/sizer.dart';

final _lightThemeData = ThemeData.light();
final _darkThemeData = ThemeData.dark();

final primaryMaterialTheme = _lightThemeData.copyWith(

    colorScheme: ColorScheme(
      primary: Color(0xff662363),
      primaryContainer: Color(0xff7d6d74),
      secondary: Color(0xffbfbade),
      secondaryContainer: Color(0xffddb0d5),
      background: Color(0xff090909),
      brightness: Brightness.light,
      error: Color(0xff99ff00),
      onBackground: Color(0xfffff6fd),
      onError: Color(0xffe1d7df),
      onSecondary: Color(0xffae9aad),
      onPrimary: Color(0xffec7ed1),
      onSurface: Colors.white,
      
      surface: Color(0xff575a5f),
    ),
    textTheme: _lightThemeData.textTheme.copyWith(
    
      bodyText1: TextStyle(color: Color(0xff662363),fontFamily: Constants.fontFamily,fontWeight: FontWeight.w400,fontSize: 10.sp),
       bodyText2: TextStyle(color: Colors.white,fontFamily: Constants.fontFamily,fontWeight: FontWeight.w500),
      headline1:TextStyle(color: Color(0xff662363),fontWeight: FontWeight.w700,fontFamily: Constants.fontFamily),
      headline6: TextStyle(fontSize: 18.0, fontFamily: Constants.fontFamily),
      button: TextStyle(fontSize: 16.0, letterSpacing: 1),
      subtitle2: TextStyle(fontFamily: Constants.fontFamily),
      headline3: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.black,
          fontFamily: Constants.fontFamily),
    ));
final darkMaterialTheme = _darkThemeData.copyWith(
  colorScheme: ColorScheme(
    primary: Colors.white,
    primaryVariant: Colors.white,
    secondary: Color.fromRGBO(0, 149, 246, 1),
    secondaryVariant: Colors.white,
    background: Colors.white,
    brightness: Brightness.light,
    error: Colors.red,
    onBackground: Colors.white,
    onError: Colors.red,
    onSecondary: Colors.white,
    onPrimary: Colors.black,
    onSurface: Colors.white,
    surface: Color.fromRGBO(0, 149, 246, 1),
  ),
  textTheme: _darkThemeData.textTheme.apply(
    fontFamily: 'Open Sans',
  ),
);

final primaryCupertinoTheme = CupertinoThemeData(
  primaryColor: CupertinoDynamicColor.withBrightness(
    color: Colors.purple,
    darkColor: Colors.cyan,
  ),
);
