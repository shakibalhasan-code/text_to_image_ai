import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_data.dart';
import '../../views/bottom_contents/points_bottom_content.dart';

class MySharedServices extends GetxController implements GetxService {
  var userPoint = 0.obs;
  var isLoading = false.obs;

  late SharedPreferences _pref;

  @override
  void onInit() async {
    super.onInit();
    _pref = await SharedPreferences.getInstance();

    await initUser();
  }

  Future<void> getUserPoints() async {
    try {
      isLoading.value = true;
      final currentUserPoints = _pref.getInt(USER_POINTS_KEY) ?? 0;
      debugPrint('User points: $currentUserPoints');

      userPoint.value = currentUserPoints;
    } catch (e) {
      debugPrint('Error fetching user points: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> initUser() async {
    try {
      isLoading.value = true;

      final isNewUser = _pref.getBool(USER_KEY) ?? true;

      if (isNewUser) {
        userPoint.value = newUserCredit; // Assuming `newUserCredit` is defined.
        _pref.setBool(USER_KEY, false);
        _pref.setInt(USER_POINTS_KEY, userPoint.value);

        // Trigger UI action (optional to keep here)
        Get.bottomSheet(
          PointsBottomContent(points: userPoint.value),
          backgroundColor: Colors.white,
        );
      } else {
        await getUserPoints();
      }
    } catch (e) {
      debugPrint('Error during user initialization: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
