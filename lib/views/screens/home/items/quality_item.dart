import 'package:flutter/material.dart';
import 'package:simple_image_genarator/utils/style.dart';

class QualityItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const QualityItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: secondaryColor),
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
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                style:
                    titleBoldText.copyWith(fontSize: 12, color: secondaryColor),
              )
            ],
          )),
    );
  }
}
