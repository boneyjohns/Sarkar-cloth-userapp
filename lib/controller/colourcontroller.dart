import 'package:get/get.dart';

class Colourcontroller extends GetxController {
  RxInt selectedindex = 0.obs;

  colourchange(int index) {
    selectedindex.value = index;
  }
}
