import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class BasicIcon extends StatelessWidget {
  final HeroIcons iconHero;
  const BasicIcon({super.key, required this.iconHero});

  @override
  Widget build(BuildContext context) {
    return HeroIcon(iconHero, size: 24, color: Colors.white);
  }
}
