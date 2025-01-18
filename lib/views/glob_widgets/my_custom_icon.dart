import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:simple_image_genarator/utils/style.dart';

class MyCustomIcon extends StatelessWidget {
  final HeroIcons icon;
  const MyCustomIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueAccent.withOpacity(0.4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HeroIcon(icon, color: Colors.black, size: 18),
      ),
    );
  }
}
