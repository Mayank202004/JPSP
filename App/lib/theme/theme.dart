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
    )
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

);