import 'package:get/get.dart';

class OrderController extends GetxController {
  //TODO: Implement OrderController

  var selctedIndex = -1;

  void changeColor(var index) {
    selctedIndex = index;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
