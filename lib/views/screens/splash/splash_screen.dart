import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_image_genarator/core/services/my_shared_preference.dart';
import 'package:simple_image_genarator/getx/splash/splash_screen_state.dart';
import 'package:simple_image_genarator/utils/images.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/screens/tab/tab_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final _splashState = Get.put(SplashScreenState());


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
            child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    // Title Text
    Text(
    'Transform Your Idea Into Reality',
    style: titleText.copyWith(
    fontWeight: FontWeight.w900,
    color: Colors.white,
    fontSize: screenWidth * 0.07,
    ),
    textAlign: TextAlign.center,
    ),
    const SizedBox(height: 10),
    // Subtitle Text
    Text(
    'Your AI visual assistant, tailored to your creativity with over 25+ effects.',
    style: bodyText.copyWith(
    fontSize: screenWidth * 0.04,
    color: Colors.white70,
    ),
    textAlign: TextAlign.center,
    ),
    const SizedBox(height: 40),
    // Start Button
    CircularProgressIndicator(color: Colors.white,backgroundColor: secondaryColor)
    ],
    )),
        ],
      ),
    );
  }
}



