import 'package:flutter/material.dart';

class RushBasket extends StatelessWidget {
  const RushBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
             
              Container(
                width: 200,
                height: 40,
                color: const Color(0xff194872),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                    const Text.rich(
                      TextSpan(
                          text: "Rush",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Baskets",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFEF8120),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
               const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/Profile.png"),)

            ]),
            // Positioned(
            //   top: 0,
              // child: CircleAvatar(
              //   radius: 25,
              //   backgroundImage: AssetImage("assets/images/Profile.png"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
