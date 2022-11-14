import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetQuoteEightController extends GetxController {
  //TODO: Implement GetQuoteEightController
  String getValue = '';
  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    getValue = sp.getString('buttonText') ?? '';
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
