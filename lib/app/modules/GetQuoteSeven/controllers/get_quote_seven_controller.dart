import 'package:get/get.dart';

class GetQuoteSevenController extends GetxController {
  //TODO: Implement GetQuoteSevenController

  var val;

  bool checkBool = false;

  void changeCheckBox(var value) {
    checkBool = !checkBool;
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
