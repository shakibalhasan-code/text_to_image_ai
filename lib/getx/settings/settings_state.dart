import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsState extends GetxController {
  var notificationSwith = false.obs;

  Future<void> lunchMyUrl(String url) async {
    try {
      final _url = Uri.parse(url);
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (e) {
      print(e);
    }
  }
}
