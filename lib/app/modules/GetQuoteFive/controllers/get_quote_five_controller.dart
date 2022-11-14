import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetQuoteFiveController extends GetxController {
  //TODO: Implement GetQuoteFiveController

  var selectedIndex = 1;

  void changeColor(var index) {
    selectedIndex = index;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String getValue = '';

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
