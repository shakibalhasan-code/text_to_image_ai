import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:simple_image_genarator/utils/style.dart';

class MyCustomIcon extends StatelessWidget {
  final HeroIcons icon;
  final Color? color;
  final VoidCallback? onTap;
  const MyCustomIcon({super.key, required this.icon, this.color,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HeroIcon(icon, color: color ?? Colors.black, size: 18),
        ),
      ),
    );
  }
}
