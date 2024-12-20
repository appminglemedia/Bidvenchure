import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../Controller/otpController.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final OtpController otpController =
        Get.put(OtpController()); // Initialize the controller

    return Scaffold(
      backgroundColor: const Color(0xfffafafc),
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafc),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Verification",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "We’ve send you the verification code on \n+91 8173048408",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 25,
            ),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 45,
              spaceBetween: 25,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.center,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                print("Completed : $pin");
              },
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Get.toNamed("/bottomNavBar");
              },
              child: Container(
                height: 58,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xff5669ff),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "CONTINUE",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: width / 5,
                      ),
                      SvgPicture.asset("assets/icons/right_arrow.svg")
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      otpController.isButtonEnabled.value
                          ? ""
                          : "Resend OTP in ${otpController.remainingSeconds.value}",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    if (otpController.isButtonEnabled.value)
                      TextButton(
                        onPressed: otpController.isButtonEnabled.value
                            ? () {
                                otpController.resendCode();
                              }
                            : null,
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(color: Color(0xff5669FF)),
                        ),
                      ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
