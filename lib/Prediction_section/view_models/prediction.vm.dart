import 'package:flutter/material.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';

/// 🧠 Prediction ViewModel
class PredictionViewModel extends ChangeNotifier {
  // 🟦 General Prediction Info
  String featuredTitle = "Kerala Lottery – First Prize";
  String predictedForDay = "Friday";
  List<String> predictionNumbers = ["2834", "3745", "2934", "4834"];
  String activePlan = "PLAN 2";

  // 🟢 Determines if today's prediction is available
  bool todayPredicted = false;

  // 🟨 All Lotteries displayed in HomeScreen Grid
  List<LotteryModel> allLotteries = [
    LotteryModel(
      name: "Bhagyathara",
      prizes: 5,
      iconPath: 'assets/icons/Bhagyathara_icon.png',
      iconBgColor: Colors.redAccent,
    ),
    LotteryModel(
      name: "Sthree Sakthi",
      prizes: 5,
      iconPath: 'assets/icons/Sthree Sakthi_icon.png',
      iconBgColor: Colors.green,
    ),
    LotteryModel(
      name: "Dhanalekshmi",
      prizes: 5,
      iconPath: 'assets/icons/Dhanalekshmi_icon.png',
      iconBgColor: Colors.blueAccent,
    ),
    LotteryModel(
      name: "Karunya Plus",
      prizes: 5,
      iconPath: 'assets/icons/Karunya Plus_icon.png',
      iconBgColor: Colors.orangeAccent,
    ),
  ];

  // 🏆 Prize categories (for detail page)
  List<Map<String, String>> prizeCategories = [
    {
      "title": "FIRST PRIZE",
      "amount": "₹80 Lakh",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "SECOND PRIZE",
      "amount": "₹10 Lakh",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "THIRD PRIZE",
      "amount": "₹1 Lakh",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "FOURTH PRIZE",
      "amount": "₹5,000",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "FIFTH PRIZE",
      "amount": "₹1,000",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "FIFTH PRIZE",
      "amount": "₹1,000",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "FIFTH PRIZE",
      "amount": "₹1,000",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "FIFTH PRIZE",
      "amount": "₹1,000",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "FIFTH PRIZE",
      "amount": "₹1,000",
      "drawDate": "Draw: 25 Oct 2025",
    },
    {
      "title": "FIFTH PRIZE",
      "amount": "₹1,000",
      "drawDate": "Draw: 25 Oct 2025",
    },
  ];

  // 🔄 Toggle today's prediction availability
  void toggleTodayPrediction() {
    todayPredicted = !todayPredicted;
    notifyListeners();
  }

  // 🧩 Update featured prediction details
  void updatePrediction({String? title, String? day, List<String>? numbers}) {
    if (title != null) featuredTitle = title;
    if (day != null) predictedForDay = day;
    if (numbers != null) predictionNumbers = numbers;
    notifyListeners();
  }

  // 💎 Update active plan
  void updatePlan(String plan) {
    activePlan = plan;
    notifyListeners();
  }

  // 🏆 Get prizes for a specific lottery
  List<Map<String, String>> getPrizesForLottery(String lotteryName) {
    // Here you can customize prize lists per lottery in future
    return prizeCategories;
  }
}
