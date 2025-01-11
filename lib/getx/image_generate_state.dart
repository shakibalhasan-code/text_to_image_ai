import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_image_genarator/utils/app_data.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:stability_image_generation/stability_image_generation.dart';

class ImageGenerateState extends GetxController {
  var isLoading = false.obs;
  var generatedImage = Rxn<Uint8List>(); // Reactive variable to hold image
  final StabilityAI _ai = StabilityAI();

  final isDownloading = false.obs;

  Future<void> generate(
      String query, ImageAIStyle imageAIStyle, String width) async {
    isLoading.value = true;

    try {
      Uint8List image = await _ai.generateImage(
          apiKey: apiKey, imageAIStyle: ImageAIStyle.cartoon, prompt: query);
      generatedImage.value = image; // Update image
    } catch (e) {
      Get.snackbar('Error', 'Failed to generate image: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Function to save the image to external storage (gallery)
  Future<void> saveImageToGallery() async {
    try {
      isDownloading.value = true;
      if (generatedImage.value == null) {
        Get.snackbar('Error', 'No image to save');
        return;
      }

      if (await _requestPermission(Permission.storage) == true) {
        print("Permission is granted");

        // Get the external storage directory
        final directory = Directory('/storage/emulated/0/TextToImage');
        if (!directory.existsSync()) {
          directory.createSync(recursive: true);
        }

        final filePath =
            '${directory.path}/generated_image_${DateTime.now().millisecondsSinceEpoch}.png';
        final file = File(filePath);

        // Write the image to external storage
        await file.writeAsBytes(generatedImage.value!);

        Get.snackbar('Success', 'Image saved in Downloads folder');
      } else {
        Get.bottomSheet(Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Warning !',
                      style: titleBoldText.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor),
                    ),
                    const Spacer(),
                    Text(
                      'close',
                      style: titleBoldText.copyWith(
                          fontSize: 14, color: secondaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: HeroIcon(
                    HeroIcons.folder,
                    size: 100,
                    color: secondaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'To Save this image we need file manager permission, please allow permission and save it',
                    style: titleBoldText.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await saveImageToGallery();
                    },
                    child: Text('Allow Permission & Save')),
              ],
            ),
          ),
        ));
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to save image: $e');
    } finally {
      isDownloading.value = false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      var re = await Permission.manageExternalStorage.request();
      if (re.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      if (await permission.isGranted) {
        return true;
      } else {
        var result = await permission.request();
        if (result.isGranted) {
          return true;
        } else {
          return false;
        }
      }
    }
  }
}
