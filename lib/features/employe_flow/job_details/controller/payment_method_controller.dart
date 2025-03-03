import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  RxString selectedType = "".obs;
  void changeMethod(String methode) {
    selectedType.value = methode;
  }
}
