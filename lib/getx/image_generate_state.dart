import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simple_image_genarator/utils/app_data.dart';

class ImageGenerateState extends GetxController {
  var isLoading = false.obs;

  Future<void> generateNow(
      String prompt, String quality, String resolution) async {
    try {
      isLoading.value = true;

      // Append quality-based style to the prompt
      String styledPrompt = _applyQualityToPrompt(prompt, quality);

      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'prompt': '3cats eating rices',
          'n': 1,
          'size': "256x256", // "256x256", "512x512", "1024x1024"
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print(response);
      } else {
        print('Status Code: ${response.statusCode}');
        print('Error Body: ${response.body}');
        Get.snackbar('Error', 'Failed to generate');
        Get.snackbar('Error', 'Failed to generate');
      }
    } catch (e) {
      print('myerror+$e');
    } finally {
      isLoading.value = false;
    }
  }

// Function to append quality-based style
  String _applyQualityToPrompt(String prompt, String quality) {
    switch (quality.toLowerCase()) {
      case 'realistic':
        return "$prompt in a photorealistic style, highly detailed, ultra HD";
      case 'artistic':
        return "$prompt as a digital painting, vivid colors, high resolution";
      case 'cartoon':
        return "$prompt in a cartoon style, bright colors, 2D illustration";
      case '3d render':
        return "$prompt as a 3D render, high detail, cinematic lighting";
      default:
        return prompt; // Default: no additional style
    }
  }
}
