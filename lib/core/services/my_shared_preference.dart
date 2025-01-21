import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_image_genarator/utils/app_data.dart';
import 'package:simple_image_genarator/utils/style.dart';
import 'package:simple_image_genarator/views/bottom_contents/points_bottom_content.dart';
import 'package:simple_image_genarator/views/glob_widgets/my_custom_icon.dart';

class MySharedServices extends GetxService {


  var userPoint = 0.obs;
  var isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    initUser();
  }


  Future<void>getUserPoints()async{
    try{
      isLoading.value = true;
      final SharedPreferences _pref = await SharedPreferences.getInstance();
      final currentUserPoints =  _pref.getInt(USER_POINTS_KEY);
      if(currentUserPoints !=null){
        userPoint.value = currentUserPoints;
      }else{
        userPoint.value = 0;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;

    }
  }


  Future<void>initUser()async{
    try{
      isLoading.value = true;
      final SharedPreferences _pref = await SharedPreferences.getInstance();
      final _userNew =  _pref.getBool(USER_KEY);
      if(_userNew == true){
        Get.bottomSheet(
          backgroundColor: Colors.white,
          PointsBottomContent(points: userPoint.value),

        );
        userPoint.value = newUserCredit;
        _pref.setBool(USER_KEY, false);
        _pref.setInt(USER_POINTS_KEY, userPoint.value);

      }else if(_userNew ==false)  {
        await getUserPoints();
      }

    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }
  }
}