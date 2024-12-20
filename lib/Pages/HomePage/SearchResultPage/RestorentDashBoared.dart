import 'dart:io';

import 'package:bidvenchure_user/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RestroDashBoardPage extends StatefulWidget {
  const RestroDashBoardPage({super.key});

  @override
  State<RestroDashBoardPage> createState() => _RestroDashBoardPageState();
}

class _RestroDashBoardPageState extends State<RestroDashBoardPage> {
  List<File> images = []; // List to store multiple images
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    print("picked image");
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null && images.length < 6) {
      setState(() {
        images.add(File(pickedFile.path)); // Add picked image to list
        print("iamge selected");
      });
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Gallery"),
                  onTap: () {
                    Get.back();
                    _pickImage(ImageSource.gallery);
                    print("object galary");
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    Get.back();
                    _pickImage(ImageSource.camera);
                    print("object galary");
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: Icon(Icons.arrow_back),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/hotel.png",
                  width: double.infinity,
                  // height: 330,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 221, left: 3, right: 3),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 120,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: appColor,
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Modern fast-find Greek food",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Open now • Closes at 9:41 PM",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                            Icon(Icons.star, color: Colors.amber),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pictures",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                      onTap: () => _showImageSourceActionSheet(context),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 0.3,
                                  spreadRadius: 0,
                                ),
                              ]),
                          child: const Icon(Icons.add, color: Colors.blue))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two images per row
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: images.isEmpty
                    ? 6
                    : images.length, // 4 placeholders if no images
                itemBuilder: (context, index) {
                  // If no images, display the placeholders
                  if (images.isEmpty) {
                    return Container(
                      // height: 150,
                      // width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.grey,
                          size: 50,
                        ),
                      ),
                    );
                  } else {
                    // Display images when available
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        images[index], // Display image from list
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
