import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/services/my_shared_preference.dart';

class SplashScreenState extends GetxController{


  var isNewUser = true.obs;
  var isLoading = false.obs;

  static const String USERNEWKEY = 'isUserNew';

  @override
  void onInit() {
    super.onInit();
    initUser();
  }

  Future<void>initUser()async{
    try{
      isLoading.value = true;
      SharedPreferences _pref = await SharedPreferences.getInstance();
      final user = _pref.getBool(USERNEWKEY);
      isNewUser.value = user ?? true;
      if(user == false || user !=null){
        Get.offAllNamed('/tab');
      }
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }
  }

  Future<void>assignNewUser(bool isNew)async{
    try{
      isLoading.value = true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(USERNEWKEY, isNew);
      isNewUser.value = false;
      Get.offAllNamed('/tab');
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }
  }



}