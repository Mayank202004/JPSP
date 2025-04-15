import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  final box = GetStorage();
  final String _key = 'themeMode';

  @override
  void onInit() {
    super.onInit();
    String? storedTheme = box.read(_key);
    if (storedTheme == 'dark') {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
  }

  void toggleTheme() {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
      box.write(_key, 'light');
    } else {
      themeMode.value = ThemeMode.dark;
      box.write(_key, 'dark');
    }
    update();
  }

  void setDark(bool isDark) {
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
    box.write(_key, isDark ? 'dark' : 'light');
    update();
  }
}
