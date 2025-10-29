// import 'package:flutter/material.dart';
// import 'package:ziya_lottery_app/Home/models/lottery.dart';
// import 'package:ziya_lottery_app/authentication/models/auth_model.dart';

// class HomeViewModel extends ChangeNotifier {
//   bool isLoading = false;
//   bool isPlanExpired = false;

//   UserModel currentUser = UserModel(
//     name: "John Doe",
//     currentPlan: "Free Plan",
//     hasFreePlan: true,
//   );

//   List<WinnerModel> recentWinners = [];
//   List<String> adImages = [];

//   // 🪙 Available upgrade plans
//   final List<Map<String, String>> upgradePlans = [
//     {"name": "Basic Plan", "icon": "assets/icons/star_icon.png"},
//     {"name": "Premium Plan", "icon": "assets/icons/premium_icon.png"},
//     {"name": "Elite Plan", "icon": "assets/icons/elite_icon.png"},
//   ];

//   Map<String, String>? purchasedPlan;

//   HomeViewModel() {
//     // ✅ Runs after provider is mounted (no rebuild conflict)
//     Future.microtask(() => _loadData());
//   }

//   Future<void> _loadData() async {
//     isLoading = true;
//     notifyListeners();

//     await Future.delayed(const Duration(milliseconds: 800));

//     // 🔄 Change manually for testing
//     //setFreePlan();
//     setPurchasedPlan("Basic Plan");
//     //setPlanExpired();

//     await Future.delayed(const Duration(milliseconds: 500));

//     recentWinners = List.generate(
//       6,
//       (index) => WinnerModel(
//         name: "Anithya Suresh",
//         lotteryName: "Bhagyathara",
//         ticketNumber: "NO-789021",
//         location: "Kollam, Kerala",
//         prediction: "Predicted",
//         dateWon: "Won on 25 Oct 2025",
//       ),
//     );

//     adImages = [
//       'https://imgs.search.brave.com/dr0gsk1zgMV74Qz9Tql7zfqEv9AJl6YkvKxH04elgSA/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vRUFGdkcz/MnNEZncvMS8wLzE2/MDB3L2NhbnZhLWRh/cmstYnJvd24tbW9k/ZXJuLWRpZ2l0YWwt/bWFya2V0aW5nLWNv/dXJzZS1wcm9tby1m/YWNlYm9vay1hZC05/bWp1ejdsVE9KMC5q/cGc',
//       'https://imgs.search.brave.com/xztxow_L0viEan5TeDpB0rYPcry5V3mAEZnsIsJcFIM/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vRUFHZG8y/YmUtV0EvMS8wLzE2/MDB3L2NhbnZhLWJs/dWUtYW5kLXdoaXRl/LW1vZGVybi1kaWdp/dGFsLW1hcmtldGlu/Zy1hZ2VuY3ktZmFj/ZWJvb2stYWQtRnhp/R2VsQzdVeU0uanBn',
//       'https://imgs.search.brave.com/Cv573w5BLjAU9zd98RK-GtX2KUKQgYj4RfkNqJ6ccLM/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vRUFHVFNV/MjJaMncvMS8wLzE2/MDB3L2NhbnZhLWJs/dWUtYW5kLWdyZXkt/bW9kZXJuLW9ubGlu/ZS1sZWFybmluZy1j/b3Vyc2UtZmFjZWJv/b2stYWQtMlZ1N1Fl/UmpxdGMuanBn',
//     ];

//     isLoading = false;
//     notifyListeners();
//   }

//   // ✅ Set as Free Plan
//   void setFreePlan() {
//     currentUser = UserModel(
//       name: "John Doe",
//       currentPlan: "Free Plan",
//       hasFreePlan: true,
//     );
//     purchasedPlan = null;
//     isPlanExpired = false;
//     notifyListeners();
//   }

//   // ✅ Simulate Purchased Plan
//   void setPurchasedPlan(String planName) {
//     final selected = upgradePlans.firstWhere(
//       (plan) => plan["name"] == planName,
//       orElse: () => {},
//     );

//     if (selected.isNotEmpty) {
//       purchasedPlan = selected;
//       currentUser = UserModel(
//         name: "John Doe",
//         currentPlan: selected["name"]!,
//         hasFreePlan: false,
//       );
//       isPlanExpired = false;
//       notifyListeners();
//     }
//   }

//   // ✅ Simulate Expired Plan
//   void setPlanExpired() {
//     currentUser = UserModel(
//       name: "John Doe",
//       currentPlan: "Expired Plan",
//       hasFreePlan: false,
//     );
//     purchasedPlan = null;
//     isPlanExpired = true;
//     notifyListeners();
//   }

//   // 🆕 Manually simulate purchase
//   void purchasePlan(String planName) {
//     setPurchasedPlan(planName);
//   }
// }
import 'package:flutter/material.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';
import 'package:ziya_lottery_app/authentication/models/auth_model.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isPlanExpired = false;
  bool todayPredicted = true; // ✅ new flag

  UserModel currentUser = UserModel(
    name: "John Doe",
    currentPlan: "Free Plan",
    hasFreePlan: true,
  );

  List<WinnerModel> recentWinners = [];
  List<String> adImages = [];

  final List<Map<String, String>> upgradePlans = [
    {"name": "Basic Plan", "icon": "assets/icons/star_icon.png"},
    {"name": "Premium Plan", "icon": "assets/icons/premium_icon.png"},
    {"name": "Elite Plan", "icon": "assets/icons/elite_icon.png"},
  ];

  Map<String, String>? purchasedPlan;

  HomeViewModel() {
    Future.microtask(() => _loadData());
  }

  Future<void> _loadData() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 800));

    //setFreePlan();
    setPurchasedPlan("Basic Plan");
    //setPlanExpired();

    await Future.delayed(const Duration(milliseconds: 500));

    recentWinners = List.generate(
      6,
      (index) => WinnerModel(
        name: "Anithya Suresh",
        lotteryName: "Bhagyathara",
        ticketNumber: "NO-789021",
        location: "Kollam, Kerala",
        prediction: "Predicted",
        dateWon: "Won on 25 Oct 2025",
      ),
    );

    adImages = [
      'https://imgs.search.brave.com/dr0gsk1zgMV74Qz9Tql7zfqEv9AJl6YkvKxH04elgSA/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vRUFGdkcz/MnNEZncvMS8wLzE2/MDB3L2NhbnZhLWRh/cmstYnJvd24tbW9k/ZXJuLWRpZ2l0YWwt/bWFya2V0aW5nLWNv/dXJzZS1wcm9tby1m/YWNlYm9vay1hZC05/bWp1ejdsVE9KMC5q/cGc',
      'https://imgs.search.brave.com/xztxow_L0viEan5TeDpB0rYPcry5V3mAEZnsIsJcFIM/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vRUFHZG8y/YmUtV0EvMS8wLzE2/MDB3L2NhbnZhLWJs/dWUtYW5kZS1kaWdp/dGFsLW1hcmtldGlu/Zy1hZ2VuY3ktZmFj/ZWJvb2stYWQtRnhp/R2VsQzdVeU0uanBn',
      'https://imgs.search.brave.com/Cv573w5BLjAU9zd98RK-GtX2KUKQgYj4RfkNqJ6ccLM/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tYXJr/ZXRwbGFjZS5jYW52/YS5jb20vRUFHVFNV/MjJaMncvMS8wLzE2/MDB3L2NhbnZhLWJs/dWUtYW5kLWdyZXkt/bW9kZXJuLW9ubGlu/ZS1sZWFybmluZy1j/b3Vyc2UtZmFjZWJv/b2stYWQtMlZ1N1Fl/UmpxdGMuanBn',
    ];

    isLoading = false;
    notifyListeners();
  }

  void setFreePlan() {
    currentUser = UserModel(
      name: "John Doe",
      currentPlan: "Free Plan",
      hasFreePlan: true,
    );
    purchasedPlan = null;
    isPlanExpired = false;
    notifyListeners();
  }

  void setPurchasedPlan(String planName) {
    final selected = upgradePlans.firstWhere(
      (plan) => plan["name"] == planName,
      orElse: () => {},
    );

    if (selected.isNotEmpty) {
      purchasedPlan = selected;
      currentUser = UserModel(
        name: "John Doe",
        currentPlan: selected["name"]!,
        hasFreePlan: false,
      );
      isPlanExpired = false;
      notifyListeners();
    }
  }

  void setPlanExpired() {
    currentUser = UserModel(
      name: "John Doe",
      currentPlan: "Expired Plan",
      hasFreePlan: false,
    );
    purchasedPlan = null;
    isPlanExpired = true;
    notifyListeners();
  }

  void purchasePlan(String planName) {
    setPurchasedPlan(planName);
  }
}
