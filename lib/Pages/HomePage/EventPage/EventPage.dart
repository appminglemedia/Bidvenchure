import 'package:bidvenchure_user/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfcfd),
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
          child: Column(children: [
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    return buildCard(
                        imageUrl: "assets/images/InternationalBand.png",
                        title: "International Band Mu...",
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        description: "36 Guild Street London, UK",
                        onTap: () {
                          Get.toNamed("/biddingProgressPage");
                        });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bidding Progress",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
              const SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    return buildCard(
                        imageUrl: "assets/images/InternationalBand.png",
                        title: "International Band Mu...",
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        description: "36 Guild Street London, UK",
                        onTap: () {
                          Get.toNamed("/biddingProgressPage");
                        });
                  },
                ),
              ),
            ],
          ),
        )
      ])),
    );
  }
}

Widget buildCard(
    {required String imageUrl,
    required String title,
    required String description,
    required Icon icon,
    required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
    child: Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            color: whiteColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(imageUrl,
                      fit: BoxFit.cover, height: 150, width: 230),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Row(
                    children: [
                      icon,
                      Text(description,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: 70,
            width: 60,
            decoration: BoxDecoration(
                color: const Color(0xfffff6f2),
                borderRadius: BorderRadius.circular(20)),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    "10",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF0635A)),
                  ),
                  Text(
                    "JUNE",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF0635A)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
