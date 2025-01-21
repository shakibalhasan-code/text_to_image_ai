import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:simple_image_genarator/getx/settings/settings_state.dart';
import 'package:simple_image_genarator/utils/app_data.dart';
import 'package:simple_image_genarator/utils/app_strings.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/glob_widgets/basic_icon.dart';
import 'package:simple_image_genarator/views/glob_widgets/my_custom_icon.dart';
import 'package:simple_image_genarator/views/glob_widgets/my_list_tile.dart';

import '../../../utils/images.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _settings = Get.put(SettingsState());

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Settings',
              style: titleText.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            MyListTile(
                leadingIcon: notificationIcon,
                trailingChild: Obx(() {
                  return Switch(
                      activeColor: Colors.green,
                      value: _settings.notificationSwith.value,
                      onChanged: (value) {
                        _settings.notificationSwith.value =
                            !_settings.notificationSwith.value;
                      });
                }),
                title: 'Notification'),
            const SizedBox(
              height: 5,
            ),
            MyListTile(
                onTap: () => _settings.lunchMyUrl(rateUsUrl),
                leadingIcon: rateIcon,
                trailingChild: BasicIcon(iconHero: rightArrow),
                title: 'Rate Us'),
            const SizedBox(
              height: 5,
            ),
            MyListTile(
                onTap: () => _settings.lunchMyUrl(shareLink),
                leadingIcon: shareIcon,
                trailingChild: BasicIcon(iconHero: rightArrow),
                title: 'Share Now'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      await _settings.lunchMyUrl(rateUsUrl);
                    },
                    child: Text(
                      'Privacy Policy',
                      style: bodyText.copyWith(fontSize: 13, color: greyColor),
                    )),
                TextButton(
                    onPressed: () async {
                      await _settings.lunchMyUrl(rateUsUrl);
                    },
                    child: Text(
                      'Terms and Condition',
                      style: bodyText.copyWith(fontSize: 13, color: greyColor),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
