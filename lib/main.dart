import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:simple_image_genarator/core/services/ads_services.dart';
import 'package:simple_image_genarator/utils/get_route.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/screens/home/home_screen.dart';
import 'package:simple_image_genarator/views/screens/splash/splash_screen.dart';
import 'package:simple_image_genarator/views/screens/tab/tab_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Get.lazyPut(() => AdsServices());
  Get.lazyPut(()=> AdsServices());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      getPages: getPagesRoute,
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
