import 'package:flutter/material.dart';
import 'package:simple_image_genarator/utils/app_data.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/screens/home/home_screen.dart';
import 'package:simple_image_genarator/views/screens/settings/settings.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> screens = [HomeScreen(), const SettingsScreen()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 3,
        centerTitle: true,
        title: Text(appName, style: titleText.copyWith(fontSize: 18)),
        actions: [],
      ),
      body: screens[currentIndex],
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
