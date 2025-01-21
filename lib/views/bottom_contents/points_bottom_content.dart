import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heroicons/heroicons.dart';

import '../../utils/style.dart';
import '../glob_widgets/my_custom_icon.dart';

class PointsBottomContent extends StatelessWidget {
  final int points;
  const PointsBottomContent({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Congrats !',style: titleText.copyWith(color: secondaryColor),),
                  const Spacer(),
                  MyCustomIcon(onTap:(){
                    Get.back();
                  },icon: HeroIcons.xMark,color: secondaryColor)
                ],
              ),
              Center(
                child: MyCustomIcon(icon: HeroIcons.circleStack,color: secondaryColor),
              ),
              Text(points.toString(),style: titleText.copyWith(fontWeight: FontWeight.bold,fontSize: 28,color: secondaryColor),),



            ],
          ),
        )

    );
  }
}
