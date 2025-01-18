import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:heroicons/heroicons.dart';
import 'package:simple_image_genarator/utils/app_data.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/glob_widgets/my_custom_icon.dart';

class MyListTile extends StatelessWidget {
  final Widget trailingChild;
  final String title;
  final HeroIcons leadingIcon;
  final VoidCallback? onTap;
  const MyListTile(
      {super.key,
      required this.trailingChild,
      required this.title,
      required this.leadingIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.7, color: greyColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: MyCustomIcon(icon: leadingIcon),
            title: Text(
              title,
              style: bodyText.copyWith(color: Colors.white),
            ),
            trailing: trailingChild,
          )),
    );
  }
}
