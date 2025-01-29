import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:heroicons/heroicons.dart';
import 'package:simple_image_genarator/core/services/ads_services.dart';
import 'package:simple_image_genarator/core/services/my_shared_preference.dart';
import 'package:simple_image_genarator/utils/app_data.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/glob_widgets/my_custom_icon.dart';
import 'package:simple_image_genarator/views/screens/home/home_screen.dart';
import 'package:simple_image_genarator/views/screens/settings/settings.dart';

import '../../../utils/images.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> screens = [HomeScreen(), const SettingsScreen()];
  int currentIndex = 0;
  final _sharedData = Get.put(MySharedServices());
  final _adServices = Get.find<AdsServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 3,
        centerTitle: true,
        title: Text(appName, style: titleText.copyWith(fontSize: 18)),
        actions: [
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: screens[currentIndex]),
          const SizedBox(
            height: 10,
          ),
          _adServices.isLoaded.value
              ? SizedBox(
                  child: _adServices.bannerAd == null
                      ? const SizedBox()
                      : AdWidget(ad: _adServices.bannerAd!),
                )
              : SizedBox()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed, // Fixed
          elevation: 8,
          currentIndex: currentIndex,
          onTap: (i) {
            setState(() {
              currentIndex = i;
            });
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(label: 'Home', icon: homeIcon),
            BottomNavigationBarItem(label: 'Settings', icon: settingsIcon),
          ]),
    );
  }
}
