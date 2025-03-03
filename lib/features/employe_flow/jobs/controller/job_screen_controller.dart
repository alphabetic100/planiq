import 'package:get/get.dart';

class JobScreenController extends GetxController {
  RxInt selectedTab = 1.obs;
  void changeTab(int index) {
    selectedTab.value = index;
  }
}
