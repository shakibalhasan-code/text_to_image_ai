import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_image_genarator/getx/credit_controller/credit_controller.dart';
import 'package:simple_image_genarator/utils/style.dart';

class EarnCointsScreen extends StatelessWidget {
  const EarnCointsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final _creditController = Get.put(CreditController());


    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text('Earn Credits Now',style: titleText.copyWith(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        const SizedBox(height: 20),
        Expanded(
          child: Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: FortuneWheel(
                // changing the return animation when the user stops dragging
                physics: CircularPanPhysics(
                  duration: Duration(seconds: 1),
                  curve: Curves.decelerate,
                ),
                onFling: () async{
                  _creditController.controller.stream;
                },
                selected: _creditController.controller.stream,
                indicators: <FortuneIndicator>[
                  FortuneIndicator(
                    alignment: Alignment.topCenter, // <-- changing the position of the indicator
                    child: TriangleIndicator(
                      color: Colors.black, // <-- changing the color of the indicator
                      width: 20.0, // <-- changing the width of the indicator
                      height: 20.0, // <-- changing the height of the indicator
                      elevation: 0, // <-- changing the elevation of the indicator
                    ),
                  ),
                ],
                items: [
                  for(var item in _creditController.userPointsNumber) FortuneItem(child: Text(item.toString()))
                ],
              ),
            ),
          ),
        ),
          Obx((){
            return Text('Current Points: ${_creditController.userCurrentPoints.value}',style: titleText.copyWith(color: Colors.white),);
          }),
      ],),

    );
  }
}
