import 'package:flutter/material.dart';
import 'package:simple_image_genarator/utils/style.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  const GradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey.shade200, width: 1)
          boxShadow: [
            BoxShadow(
                color: secondaryColor,
                blurRadius: 4,
                blurStyle: BlurStyle.solid)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: child,
      ),
    );
  }
}
