import 'dart:async';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var remainingSeconds = 20.obs; // Observable for the timer
  var isButtonEnabled = false.obs; // Observable to check button state
  Timer? countdownTimer; // Timer object

  @override
  void onInit() {
    super.onInit();
    startTimer(); // Start the timer when the controller is initialized
  }

  void startTimer() {
    remainingSeconds.value = 20; // Reset timer to 20 seconds
    isButtonEnabled.value = false; // Disable the resend button

    // Cancel any existing timer if it's running
    countdownTimer?.cancel();

    // Create a periodic timer that fires every 1 second
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        isButtonEnabled.value = true; // Enable the resend button
        timer.cancel(); // Stop the timer once it reaches zero
      }
    });
  }

  void resendCode() {
    startTimer(); // Restart the timer when the resend button is pressed
  }

  @override
  void onClose() {
    countdownTimer
        ?.cancel(); // Cancel the timer when the controller is disposed
    super.onClose();
  }
}
