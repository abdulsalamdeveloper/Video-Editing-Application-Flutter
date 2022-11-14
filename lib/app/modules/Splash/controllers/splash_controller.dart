import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(Duration(seconds: 2));
    Get.offAndToNamed(Routes.SIGN_SELECTECTION);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
