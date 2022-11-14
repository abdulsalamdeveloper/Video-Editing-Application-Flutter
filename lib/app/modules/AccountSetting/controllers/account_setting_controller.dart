import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountSettingController extends GetxController {
  //TODO: Implement AccountSettingController
  TextEditingController userNameController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDispose() {
    super.dispose();
    userNameController.dispose();
    accountTypeController.dispose();
    phoneNumberController.dispose();
    newPasswordController.dispose();
    confirmController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
