import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedServices extends GetxService {

  var isNewUser = true.obs;
  var isLoading = false.obs;

  static const String USERNEWKEY = 'isUserNew';
  
  Future<void>initUser()async{
    try{
      isLoading.value = true;
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final user =  prefs.getBool(USERNEWKEY);

      if(user ==null){
        isNewUser.value = true;
        Get.snackbar('New User', 'No prevous data found');
      }else if(user !=null){
        isNewUser.value = user;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }
  }

  Future<void>assignNewUser()async{
    try{
      isLoading.value = true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setBool(USERNEWKEY, false);
      isNewUser.value = false;
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }
  }
}