import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chitchat/Model/UserModel.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  // For Login

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar(
        "Success 🎉",
        "Login successful!",
        colorText: Colors.white,
        backgroundColor: Colors.green
      );
      Get.offAllNamed("/welcomePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Unavailability", "No user found for that email.", colorText: Colors.white, backgroundColor: Colors.redAccent);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Wrong Password", "Wrong password provided for that user.",colorText: Colors.white, backgroundColor: Colors.redAccent);
      }else {
        Get.snackbar(
          "Login Failed",
          e.message ?? "An unknown error occurred.",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
        );
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> createUser(String email, String password, String name) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await initUser(email, name);
      Get.snackbar(
        "Account Created 🎉",
        "Welcome, $name!",
        colorText: Colors.white,
        backgroundColor: Colors.green
      );
      Get.offAllNamed("/welcomePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Weak Password", "The password provided is too weak.",colorText: Colors.white, backgroundColor: Colors.redAccent);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Email Exists", "The account already exists for that email.",colorText: Colors.white, backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> logoutUser() async {
    await auth.signOut();
    Get.offAllNamed("/authPage");
    Get.snackbar(
      "Logged Out",
      "You have been logged out successfully.",
    );
  }

  Future<void> initUser(String email, String name) async {
    var newUser = UserModel(
      email: email,
      name: name,
      id: auth.currentUser!.uid,
    );

    try {
      await db.collection("users").doc(auth.currentUser!.uid).set(
            newUser.toJson(),
          );
    } catch (ex) {
      print(ex);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Email sent", "Check your email now");
    } catch (ex) {
      print(ex);
      Get.snackbar("Error", ex.toString());
    }
  }
}
