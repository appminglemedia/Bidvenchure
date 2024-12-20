import 'package:bidvenchure_user/Pages/HomePage/EventPage/EventPage.dart';
import 'package:bidvenchure_user/Pages/HomePage/HomePage.dart';
import 'package:bidvenchure_user/Pages/HomePage/MapPage.dart';
import 'package:bidvenchure_user/Pages/HomePage/ProfilePage.dart';
import 'package:flutter/material.dart';

import '../Config/Colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // List of pages to display in the bottom navigation
  final List<Widget> _pages = [
    const HomePage(),
    const EventPage(),
    const MapPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page

      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 8,
        backgroundColor: appColor,
        onPressed: () {},
        child: const Icon(
          Icons.add_box,
          color: whiteColor,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,

      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: appColor,
          unselectedItemColor: const Color(0XFFd5d7dc),
          backgroundColor: whiteColor,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(size: 20),
        ),
      ),
    );
  }
}
