import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsServices extends GetxService {
  var isLoading = false.obs;
  var message = ''.obs;

  BannerAd? bannerAd;
  var isLoaded = false.obs;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';

  @override
  void onInit() {
    super.onInit();
    initAds();
  }

  Future<void> initAds() async {
    try {
      // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
      final size =
          await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
              MediaQuery.sizeOf(Get.context!).width.truncate());

      bannerAd = BannerAd(
        adUnitId: adUnitId,
        request: const AdRequest(),
        size: size!,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            isLoaded.value = true;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (ad, err) {
            debugPrint('BannerAd failed to load: $err');
            // Dispose the ad here to free resources.
            ad.dispose();
            isLoaded.value = false;
          },
        ),
      )..load();
    } catch (e) {
      print(e);
    }
  }
}
