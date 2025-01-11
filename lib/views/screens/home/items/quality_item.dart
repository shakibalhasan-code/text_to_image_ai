import 'package:flutter/material.dart';
import 'package:simple_image_genarator/utils/style.dart';

class QualityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;
  const QualityItem(
      {super.key,
      required this.onTap,
      required this.name,
      required this.isSelected,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: isSelected ? 2 : 1,
                  color: isSelected ? Colors.green : secondaryColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      name,
                      style: titleBoldText.copyWith(
                          fontSize: 12, color: secondaryColor),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
