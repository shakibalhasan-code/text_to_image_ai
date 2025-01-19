import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:simple_image_genarator/views/screens/home/home_screen.dart';
import 'package:simple_image_genarator/views/screens/splash/splash_screen.dart';
import 'package:simple_image_genarator/views/screens/tab/tab_screen.dart';

List<GetPage<dynamic>> get getPagesRoute {
  return [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/tab', page: () => const TabScreen())
  ];
}
