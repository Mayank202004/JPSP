import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:jpss/routes/route.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/views/homePage/homePage.dart';
import 'package:jpss/services/storage_services.dart';
import 'package:jpss/services/supabase_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("Error loading .env file: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true,
      ),
      getPages : Routes.pages,
      initialRoute: RouteNames.profile2,

      debugShowCheckedModeBanner: false,
      home: const HomePage()
    );
  }
}

