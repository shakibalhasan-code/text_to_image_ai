import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_image_genarator/core/services/my_shared_preference.dart';
import 'package:simple_image_genarator/getx/splash/splash_screen_state.dart';
import 'package:simple_image_genarator/utils/cons.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/screens/splash/intro_screen.dart';
import 'package:simple_image_genarator/views/screens/tab/tab_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final _sharedServices = Get.put(MySharedServices());


    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageSplash),
              ),
            ),
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, primaryColor],
              ),
            ),
          ),
          // Content
          // Content
          Positioned(
            left: 20,
            right: 20,
            bottom: screenHeight * 0.1,
            child: FutureBuilder(
              future: _sharedServices.initUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show loading indicator while waiting
                  return Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                } else if (snapshot.hasError) {
                  // Show error message if the future fails
                  return Center(
                    child: Text(
                      'Error initializing user: ${snapshot.error}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (snapshot.hasData) {
                  // Show appropriate screen based on `isNewUser`
                  return Obx(() {
                    return _sharedServices.isNewUser.value
                        ? IntroScreen()
                        : TabScreen();
                  });
                } else {
                  // Handle unexpected states
                  return Center(
                    child: Text(
                      'Unexpected error occurred.',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}



