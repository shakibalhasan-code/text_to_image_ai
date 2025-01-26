import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_image_genarator/core/services/my_shared_preference.dart';

class CreditController extends GetxController {
  final _sharedPref = Get.find<MySharedServices>();

  var selectedUserSpinPoints = 0.obs;
  var userCurrentPoints = 0.obs;

  late StreamController<int> controller;

  late StreamSubscription<int> subscription ;

  List<int> userPointsNumber = [3,0,4,10,8,5];

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
    controller.close();
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    // Initialize the StreamController
    controller = StreamController<int>();
    // Initialize userCurrentPoints with a value from shared preferences
    userCurrentPoints.value = _sharedPref.userPoint.value;

    // Start listening to the stream
    listenSubscription();
    print('listenSubscription has been called');
  }


  Future<void> listenSubscription() async {
    try {
      print('Setting up stream listener...');
      subscription = controller.stream.listen((userSpinPoints) {
        print('Stream emitted value: $userSpinPoints');

        // Validate the spin result
        if (userSpinPoints >= 0 && userSpinPoints < userPointsNumber.length) {
          selectedUserSpinPoints.value = userPointsNumber[userSpinPoints];
          print('Selected user spin points: ${selectedUserSpinPoints.value}');

          userCurrentPoints.value += selectedUserSpinPoints.value;
          print('Updated user current points: ${userCurrentPoints.value}');

          _sharedPref.userPoint.value = userCurrentPoints.value;
          print('Saved to shared preferences: ${_sharedPref.userPoint.value}');
        } else {
          print('Invalid spin result: $userSpinPoints');
        }
      });
    } catch (e) {
      debugPrint('Error in listenSubscription: $e');
    }
  }





}