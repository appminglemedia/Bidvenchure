import 'package:bidvenchure_user/Config/Colors.dart';
import 'package:bidvenchure_user/Controller/SearchResultController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchResultController searchResultController =
        Get.put(SearchResultController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onPressed: () {
            // Handle back button action
          },
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Stack(children: [
            Container(
              padding: const EdgeInsets.all(20),
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
                    suffixIcon: TextButton(
                        onPressed: () {
                          Get.toNamed("/bidForm");
                        },
                        child: const Text(
                          "Form for Biding",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: whiteColor,
                              decoration: TextDecoration.underline,
                              decorationColor: whiteColor),
                        ))),
              ),
            ),
            // Custom TabBar with Containers as Tabs
            Padding(
              padding: const EdgeInsets.only(top: 72, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Gold Tab
                  GestureDetector(
                    onTap: () {
                      searchResultController.tabController.animateTo(0);
                    },
                    child: Obx(() => customTab(
                          "Gold",
                          searchResultController.selectedIndex.value == 0
                              ? Colors.yellow
                              : Colors.white,
                          searchResultController.selectedIndex.value == 0
                              ? Colors.white
                              : Colors.black,
                        )),
                  ),
                  // Platinum Tab
                  GestureDetector(
                    onTap: () {
                      searchResultController.tabController.animateTo(1);
                    },
                    child: Obx(() => customTab(
                          "Platinum",
                          searchResultController.selectedIndex.value == 1
                              ? const Color(0xffA27762)
                              : Colors.white,
                          searchResultController.selectedIndex.value == 1
                              ? Colors.white
                              : Colors.black,
                        )),
                  ),
                  // Silver Tab
                  GestureDetector(
                    onTap: () {
                      searchResultController.tabController.animateTo(2);
                    },
                    child: Obx(() => customTab(
                          "Silver",
                          searchResultController.selectedIndex.value == 2
                              ? const Color(0xffC0C0C0)
                              : Colors.white,
                          searchResultController.selectedIndex.value == 2
                              ? Colors.white
                              : Colors.black,
                        )),
                  ),
                ],
              ),
            ),
          ]),

          // Expanded TabBarView with content
          Expanded(
            child: TabBarView(
              controller: searchResultController.tabController,
              children: [
                // Gold Tab
                ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return buildCard(
                      imageUrl: 'assets/images/hotel.png',
                      title: 'Modern fast-find Greek food',
                      description:
                          'I need a professional web developer to create',
                      tagUrl: "assets/images/gold.png",
                    );
                  },
                ),

                // Platinum Tab
                ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return buildCard(
                      imageUrl: 'assets/images/hotel.png',
                      title: 'Modern fast-find Greek food',
                      description:
                          'I need a professional web developer to create',
                      tagUrl: 'assets/images/platinum.png',
                    );
                  },
                ),

                // Silver Tab
                ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return buildCard(
                      imageUrl: 'assets/images/hotel.png',
                      title: 'Modern fast-find Greek food',
                      description:
                          'I need a professional web developer to create',
                      tagUrl: 'assets/images/silver.png',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom Tab Widget
  Widget customTab(String label, Color backgroundColor, Color textColor) {
    return Container(
      height: 29,
      width: 80,
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black26,
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Card Widget
  Widget buildCard(
      {required String imageUrl,
      required String title,
      required String description,
      required String tagUrl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Stack(
        children: [
          Card(
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
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(height: 8),
              ],
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
}
