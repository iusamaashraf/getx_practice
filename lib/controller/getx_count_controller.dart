import 'package:get/get.dart';

class GetxCountController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}
