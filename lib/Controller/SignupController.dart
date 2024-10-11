import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  var isSwitched = false.obs;

  // Method to toggle the switch state
  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }
}
