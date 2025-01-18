import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/screens/home/home_screen.dart';
import 'package:simple_image_genarator/views/screens/splash/splash_screen.dart';
import 'package:simple_image_genarator/views/screens/tab/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: Scaffold(
        backgroundColor: primaryColor,
        body: SplashScreen(),
      ),
    );
  }
}
