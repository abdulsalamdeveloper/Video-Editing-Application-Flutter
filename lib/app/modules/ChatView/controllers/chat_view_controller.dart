import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatViewController extends GetxController {
  //TODO: Implement ChatViewController
  TextEditingController searchController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
