import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splashHandle();
  }

  Future<void> splashHandle() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Get.toNamed("/signupPage");
  }
}
