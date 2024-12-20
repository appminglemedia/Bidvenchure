// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Signupcontroller extends GetxController {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneNumController = TextEditingController();
//   TextEditingController organizationGSTController = TextEditingController();

//   var isSwitched = false.obs;

//   // Method to toggle the switch state
//   void toggleSwitch(bool value) {
//     isSwitched.value = value;
//   }
// }

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  var isSwitched = false.obs;
  var selectedRole = 'Individual'
      .obs; // This will track the selected role (Individual or Organization)

  // Your existing controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController refferalController = TextEditingController();
  TextEditingController gstController = TextEditingController();

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }

  // Method to change role (Individual or Organization)
  void changeRole(String role) {
    selectedRole.value = role;
  }
}
