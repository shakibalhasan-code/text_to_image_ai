import 'dart:ui';

import 'package:flutter/material.dart';

var primaryColor = Color(0xff1f294c);
var secondaryColor = Color(0xff6c73bd);
const foregroundColor = Colors.white;

const titleBoldText =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

var myTheme = ThemeData(
    cardTheme: CardTheme(
      clipBehavior: Clip.none,
      elevation: 0,
      shadowColor: secondaryColor,
      color: primaryColor, // Background color of the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Rounded corners
        side: BorderSide(color: secondaryColor, width: 1), // Border with color
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor:
          primaryColor.withOpacity(0.2), // Background color of input field
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: secondaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: secondaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            textStyle: MaterialStatePropertyAll(titleBoldText.copyWith(
                fontWeight: FontWeight.bold, color: foregroundColor)),
            backgroundColor: WidgetStatePropertyAll(secondaryColor),
            foregroundColor: WidgetStatePropertyAll(foregroundColor))));
