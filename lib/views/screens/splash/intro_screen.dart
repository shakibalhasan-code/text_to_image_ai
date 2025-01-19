import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_image_genarator/core/services/my_shared_preference.dart';

import '../../../utils/cons.dart';
import '../../../utils/style.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    final _sharedPreference = Get.put(MySharedServices());

    return Column(
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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.3,
              vertical: screenHeight * 0.02,
            ),
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 5,
          ),
          onPressed: () async{
            await _sharedPreference.assignNewUser();
            Get.offAllNamed('/tab');
          },
          child: Text(
            'Start Now',
            style: titleText.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.05,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
