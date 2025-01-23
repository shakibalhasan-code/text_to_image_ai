import 'package:get/get.dart';
import 'package:simple_image_genarator/core/models/quality_model.dart';

class HomeState extends GetxController {
  var selectedResolution = '1:1'.obs;
  var selectedQuality = 'Anime'.obs;

  final List<String> resoList = [
    '16:9',
    '1:1',
    '21:9',
    '2:3',
    '3:2',
    '4:5',
    '5:4',
    '9:16',
    '9:21'
  ];

}
