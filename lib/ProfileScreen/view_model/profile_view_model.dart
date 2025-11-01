import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  String userName = "John";
  String phoneNumber = "0987654321";
  String location = "Kerala";
  String planName = "Plan 1";
  bool isActivePlan = true;
  String language = "English";
  String profileImageUrl = "https://i.pravatar.cc/300";

  void changeLanguage(String newLang) {
    language = newLang;
    notifyListeners();
  }

  void logout(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "You’ve been logged out successfully.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
