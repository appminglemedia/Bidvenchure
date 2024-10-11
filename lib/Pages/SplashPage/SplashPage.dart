import 'package:bidvenchure_user/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "BidVenchure",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
