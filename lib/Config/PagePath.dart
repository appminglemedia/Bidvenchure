import 'package:bidvenchure_user/Pages/AuthPage/OtpPage.dart';
import 'package:bidvenchure_user/Pages/AuthPage/SignupPage.dart';
import 'package:bidvenchure_user/Pages/HomePage/EventPage/BidingProgress.dart';
import 'package:bidvenchure_user/Pages/HomePage/EventPage/EventPage.dart';
import 'package:bidvenchure_user/Pages/HomePage/SearchResultPage/AllBiddingRestro.dart';
import 'package:bidvenchure_user/Pages/HomePage/SearchResultPage/BidingForm.dart';
import 'package:bidvenchure_user/Pages/HomePage/SearchResultPage/RestorentDashBoared.dart';
import 'package:bidvenchure_user/Pages/HomePage/homePage.dart';
import 'package:bidvenchure_user/Widget/BottomNavigationBar.dart';
import 'package:get/get.dart';

import '../Pages/HomePage/SearchResultPage/SearchResultPage.dart';

var pagePath = [
  GetPage(
      name: "/signupPage",
      page: () => const SignUpPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/otpPage",
      page: () => const OtpPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/bottomNavBar",
      page: () => BottomNavBar(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/homePage",
      page: () => const HomePage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/searchResultPage",
      page: () => SearchResultPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/bidForm",
      page: () => BidingForm(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/eventPage",
      page: () => const EventPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/biddingProgressPage",
      page: () => const BidingProgressPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/allBiddingRestoPage",
      page: () => const AllBiddingRestroPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/restroDashBoardPage",
      page: () => const RestroDashBoardPage(),
      transition: Transition.rightToLeft),
];
