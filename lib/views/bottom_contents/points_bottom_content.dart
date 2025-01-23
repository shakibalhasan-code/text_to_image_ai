import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import '../../utils/style.dart';
import '../glob_widgets/my_custom_icon.dart';

class PointsBottomContent extends StatelessWidget {
  final int points;
  const PointsBottomContent({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Congratulations!',
                style: titleText.copyWith(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              MyCustomIcon(
                onTap: () => Get.back(),
                icon: HeroIcons.xMark,
                color: secondaryColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          MyCustomIcon(
            icon: HeroIcons.circleStack,
            color: secondaryColor,

          ),
          const SizedBox(height: 16),
          Text(
            points.toString(),
            style: titleText.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: secondaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your Reward Points',
            style: bodyText.copyWith(
              color: secondaryColor.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
