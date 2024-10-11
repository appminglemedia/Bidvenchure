import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            print("object");
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
            // Pinput(
            //     length: 4,
            //     defaultPinTheme: PinTheme(
            //       width: 56,
            //       height: 56,
            //       textStyle: const TextStyle(fontSize: 20, color: Colors.black),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(color: Colors.grey),
            //       ),
            //     ),
            //     onCompleted: (pin) => print("OTP entered: $pin"),
            //   ),
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
              height: 24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Re-send code in  ", style: TextStyle(fontSize: 12)),
                Text(" 0:20",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
