import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsServices extends GetxService {
  var isLoading = false.obs;
  var message = ''.obs;

  BannerAd? bannerAd;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  var isBLoaded = false.obs;


  final interstitialAdId = 'ca-app-pub-3940256099942544/1033173712';


  @override
  void onInit() {
    super.onInit();
    initAds();
  }

  Future<void> initAds() async {
    try {
      await loadInterstitialAds();
      await loadInterstitialAds();
    } catch (e) {
      print(e);
    }
  }

  Future<void>loadInterstitialAds()async{
    try{
      // TODO: replace this test ad unit with your own ad unit.
      final adUnitId = Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/9214589741'
          : 'ca-app-pub-3940256099942544/2435281174';

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
            isBLoaded.value = true;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (ad, err) {
            debugPrint('BannerAd failed to load: $err');
            // Dispose the ad here to free resources.
            ad.dispose();
            isBLoaded.value = false;
          },
        ),
      )..load();
    }catch(e){
      print('banner: $e');
    }
  }

  Future<void>loadInterstitialAd()async{
    try{
      // TODO: replace this test ad unit with your own ad unit.
      final adUnitId = Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910';

      /// Loads an interstitial ad.
      InterstitialAd.load(
          adUnitId: adUnitId,
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            // Called when an ad is successfully received.
            onAdLoaded: (ad) {
              debugPrint('$ad loaded.');
              // Keep a reference to the ad so you can show it later.
              _interstitialAd = ad;
            },
            // Called when an ad request failed.
            onAdFailedToLoad: (LoadAdError error) {
              debugPrint('InterstitialAd failed to load: $error');
            },
          ));

    }catch(e){
      print('interstitialAd" $e');
    }
  }
  Future<void>initRewardAd()async{
    try{
      // TODO: replace this test ad unit with your own ad unit.
      final adUnitId = Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/5224354917'
          : 'ca-app-pub-3940256099942544/1712485313';

      RewardedAd.load(
          adUnitId: adUnitId,
          request: const AdRequest(),
          rewardedAdLoadCallback: RewardedAdLoadCallback(
            // Called when an ad is successfully received.
            onAdLoaded: (ad) {
              debugPrint('$ad loaded.');
              // Keep a reference to the ad so you can show it later.
              _rewardedAd = ad;
            },
            // Called when an ad request failed.
            onAdFailedToLoad: (LoadAdError error) {
              debugPrint('RewardedAd failed to load: $error');
            },
          ));

    }catch(e){
      print('RewardAd $e');
    }
  }

  void showInterstitialAd()async{
    if(_interstitialAd !=null){
      await _interstitialAd!.show();
    }else{
      print('interstitial ad is null');
    }
  }
}
