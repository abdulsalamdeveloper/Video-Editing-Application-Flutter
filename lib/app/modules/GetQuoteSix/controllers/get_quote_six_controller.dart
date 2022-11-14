import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GetQuoteSixController extends GetxController {
  //TODO: Implement GetQuoteSixController
  TextEditingController dropDownController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController descripController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDispose() {
    dropDownController.dispose();
    urlController.dispose();
    descripController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
