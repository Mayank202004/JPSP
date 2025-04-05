import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/theme/theme.dart';
import 'package:jpss/views/homePage/homePage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/auth_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("Error loading .env file: $e");
  }
  await GetStorage.init();
  Get.lazyPut<AuthController>(() => AuthController());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final isLoggedIn = box.read('accessToken') != null; // or 'user' key
    return GetMaterialApp(
      title: 'JPSP',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      getPages : Routes.pages,
      initialRoute: isLoggedIn ? RouteNames.homePage : RouteNames.getStarted,
      debugShowCheckedModeBanner: false,
    );
  }
}

