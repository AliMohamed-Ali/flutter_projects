import 'package:get/get.dart';

class Controller extends GetxController {
  // var count = 0.obs;
  var count1 = 0.obs;
  var count2 = 0.obs;
  increment() => count2++;
  int get sum => count1.value + count2.value;
}
