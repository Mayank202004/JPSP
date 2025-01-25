import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    //brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueAccent
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //       backgroundColor: WidgetStateProperty.all(Colors.white),
    //       foregroundColor: WidgetStateProperty.all(Colors.black),
    //     )
    // ),
    navigationBarTheme: const NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 60,
      //indicatorColor: Colors.pink,
    ),
  //textButtonTheme: const TextButtonThemeData(style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.black),backgroundColor: WidgetStatePropertyAll(Colors.white)))
);

final ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    //brightness: Brightness.dark,
    colorScheme: const ColorScheme.light(),
    navigationBarTheme: const NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 60,
      //indicatorColor: Colors.pink,
    ),
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
    //textButtonTheme: TextButtonThemeData(style: ButtonStyle(foregroundColor: const WidgetStatePropertyAll(Colors.white),backgroundColor: WidgetStatePropertyAll(const ColorScheme.light().primary))),


);