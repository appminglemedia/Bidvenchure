import 'package:bidvenchure_user/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: appColor,
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current Location ",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: whiteColor,
                )
              ],
            ),
            Text(
              "New Yourk, USA ",
              style: TextStyle(
                  color: whiteColor, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset("assets/icons/notification.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(33),
                  bottomRight: Radius.circular(33),
                ),
              ),
              child: TextFormField(
                onTap: () => Get.toNamed("/searchResultPage"),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                    hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff807bf2)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: whiteColor,
                    ),
                    suffixIcon: Container(
                      width: 90,
                      decoration: BoxDecoration(
                          color: const Color(0xff5D56F3),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/filter.svg",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Filters",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: whiteColor),
                          )
                        ],
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff747688)),
                          ),
                          Icon(Icons.arrow_right_outlined,
                              color: Color(0xff747688)),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset("assets/images/no_event.png"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InviteCard(onTap: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InviteCard extends StatelessWidget {
  final VoidCallback onTap; // Define the onTap parameter

  const InviteCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127,
      decoration: BoxDecoration(
        color: const Color(0xffd6feff),
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Invite your friends",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Get \$20 for ticket",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff484D70)),
                ),
                const SizedBox(height: 13),
                SizedBox(
                  width: 72,
                  height: 32,
                  child: FloatingActionButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    backgroundColor: const Color(0xff00F8FF),
                    onPressed: onTap, // Use the passed onTap function here
                    child: const Text(
                      "INVITE",
                      style: TextStyle(
                          color: Colors.white, // Fixed the color reference
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Positioned(
            top: -5,
            right: -24,
            child: Image.asset(
              "assets/images/gift.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
