import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendMessageController extends GetxController {
  //TODO: Implement SendMessageController
  TextEditingController msgController = TextEditingController();

  final count = 0.obs;
  @override
  void onDispose() {
    msgController.dispose();
  }

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
