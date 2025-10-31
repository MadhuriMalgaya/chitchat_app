import 'package:flutter/material.dart';
import 'package:chitchat/Config/Colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


var lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: lContainerColor
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: lBackgroundColor,
    filled: true,
    border: UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    )
  ),
  colorScheme: const ColorScheme.light(
    primary: lPrimaryColor,
    onPrimary: lOnBackgroundColor,
    background: lBackgroundColor,
    onBackground: lOnBackgroundColor,
    primaryContainer: lContainerColor,
    onPrimaryContainer: lonContainerColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      color: lPrimaryColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontSize: 30.sp,
      color: lTextColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.sp,
      color: lTextColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 15.sp,
      color: lTextColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 13.sp,
      color: lOnBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 13.sp,
      color: lonContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      color: lonContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      color: lonContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
    ),
  ),

);
  var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: dContainerColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: dBackgroundColor,
    filled: true,
    border: UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),

  ),
  colorScheme: const ColorScheme.dark(
    primary: dPrimaryColor,
    onPrimary: dOnBackgroundColor,
    background: dBackgroundColor,
    onBackground: dOnBackgroundColor,
    primaryContainer: dContainerColor,
    onPrimaryContainer: donContainerColor,
  ),
  textTheme:  TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      color: dPrimaryColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontSize: 30.sp,
      color: dOnBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.sp,
      color: dOnBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      color: dOnBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 15.sp,
      color: dOnBackgroundColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 15.sp,
      color: donContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      color: donContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      color: donContainerColor,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
    ),
  ),
);
