import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_image_genarator/utils/app_data.dart';
import 'package:simple_image_genarator/views/screens/tab/tab_screen.dart';
import '../../core/services/my_shared_preference.dart';

class SplashScreenState extends GetxController{


  // var isNewUser = true.obs;
  // var isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 4),(){
      Get.offAllNamed('/tab');
    });
  }

  // Future<void>initUser()async{
  //   try{
  //     isLoading.value = true;
  //     SharedPreferences _pref = await SharedPreferences.getInstance();
  //     final user = _pref.getBool(USER_KEY);
  //     isNewUser.value = user ?? true;
  //     if(user == true){
  //
  //     }
  //   }catch(e){
  //     print(e);
  //   }finally{
  //     isLoading.value = false;
  //   }
  // }
  //
  // Future<void>assignNewUser(bool isNew)async{
  //   try{
  //     isLoading.value = true;
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setBool(USER_KEY, isNew);
  //     isNewUser.value = false;
  //     Get.offAllNamed('/tab');
  //   }catch(e){
  //     print(e);
  //   }finally{
  //     isLoading.value = false;
  //   }
  // }



}