import 'package:bidvenchure_user/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllBiddingRestroPage extends StatelessWidget {
  const AllBiddingRestroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: appColor,
        automaticallyImplyLeading: false,
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
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search...",
                  hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff807bf2)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            buildCard(
              imageUrl: "assets/images/hotel.png",
              title: "Modern fast-find Greek food",
              description: "I need a professional web developer to create ",
              tagUrl: "assets/images/gold.png",
              bids: "Bids: 150\$",
              onTap: () => Get.toNamed("/restroDashBoardPage"),
            ),
            buildCard(
              imageUrl: "assets/images/hotel2.png",
              title: "Modern fast-find Greek food",
              description: "I need a professional web developer to create ",
              tagUrl: "assets/images/gold.png",
              bids: "Bids: 150\$",
              onTap: () => Get.toNamed("/restroDashBoardPage"),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildCard(
    {required String imageUrl,
    required String title,
    required String description,
    required String bids,
    required VoidCallback onTap,
    required String tagUrl}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            color: whiteColor,
            elevation: 4,
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
                      fit: BoxFit.cover, height: 150, width: double.infinity),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(bids,
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 120,
                      height: 30,
                      decoration: const BoxDecoration(color: Colors.red),
                      child: const Center(
                        child: Text(
                          "Reject",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Container(
                      height: 30,
                      width: 120,
                      decoration: const BoxDecoration(color: appColor),
                      child: const Center(
                        child: Text(
                          "Accept",
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: whiteColor),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
        // Gold Ribbon
        Positioned(
          top: -5,
          right: -16,
          child: Image.asset(tagUrl),
        ),
      ],
    ),
  );
}
