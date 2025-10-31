import 'package:chitchat/Pages/Welcome/WelcomePage.dart';
import 'package:get/get.dart';
import 'package:chitchat/Pages/Auth/AuthPage.dart';
import 'package:chitchat/Pages/Home/HomePage.dart';
import '../Pages/ContactPage/ContactPage.dart';
import '../Pages/ProfilePage/ProfilePage.dart';
import '../Pages/UserProfile/UpdateProfile.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => AuthPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/homePage",
    page: () => HomePage(),
    transition: Transition.rightToLeft,
  ),
 
  GetPage(
    name: "/profilePage",
    page: () => ProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/contactPage",
    page: () => ContactPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
      name: "/welcomePage",
      page: ()=> WelcomePage(),
      transition: Transition.rightToLeft),
  GetPage(
    name: "/updateProfilePage",
    page: () => UserUpdateProfile(),
    transition: Transition.rightToLeft,
  ),
];
