import 'package:bidvenchure_user/Config/Colors.dart';
import 'package:bidvenchure_user/Controller/SignupController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Signupcontroller signupController = Get.put(Signupcontroller());
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xfffafafc),
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafc),
        title: const Text("BidVenchure"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Full name",
                hintStyle:
                    const TextStyle(color: Color(0xff747688), fontSize: 14),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Color(0xff5669ff))),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(color: Color(0xffE4DFDF)),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg', // Path to your SVG asset
                    width: 22,
                    height: 22,
                    color: Colors.grey, // Optional: Apply a color to the icon
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Phone",
                hintStyle:
                    const TextStyle(color: Color(0xff747688), fontSize: 14),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Color(0xffE4DFDF))),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(color: Colors.red),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/phone.svg', // Path to your SVG asset
                    width: 22,
                    height: 22,
                    color: Colors.grey, // Optional: Apply a color to the icon
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Referral Optional",
                  hintStyle: TextStyle(color: Color(0xff747688), fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(color: Color(0xff5669ff))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Color(0xffE4DFDF)),
                  ),
                  prefixIcon: Icon(
                    Icons.group_add_outlined,
                    color: Colors.grey,
                  )
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child:
                  // SvgPicture.asset(
                  //   'assets/icons/refer.svg', // Path to your SVG asset
                  //   width: 22,
                  //   height: 22,
                  //   color: Colors.grey, // Optional: Apply a color to the icon
                  // ),
                  // ),
                  ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "if Organization",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Organization  GST",
                  hintStyle: TextStyle(color: Color(0xff747688), fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(color: Color(0xff5669ff))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Color(0xffE4DFDF)),
                  ),
                  prefixIcon: Icon(
                    Icons.group_add_outlined,
                    color: Colors.grey,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Obx(() {
                  return Switch(
                      // activeColor: Color(0xff5669ff),
                      activeTrackColor: const Color(0xff5669ff),
                      thumbColor: WidgetStateProperty.all(Colors.white),
                      value: signupController.isSwitched.value,
                      onChanged: (value) {
                        signupController.toggleSwitch(value);
                      });
                }),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Remember Me",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.toNamed("/otpPage");
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
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: width / 4.5,
                      ),
                      SvgPicture.asset("assets/icons/right_arrow.svg")
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "OR",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9D9898)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.toNamed("/otpPage");
              },
              child: Container(
                height: 58,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset("assets/icons/google.svg"),
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Login with Google",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.toNamed("/otpPage");
              },
              child: Container(
                height: 58,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset("assets/icons/facebook.svg"),
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Login with Facebook",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
