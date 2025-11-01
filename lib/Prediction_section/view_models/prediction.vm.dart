
import 'package:flutter/material.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';
import 'package:intl/intl.dart';
import 'package:ziya_lottery_app/Prediction_section/Service/prediction_service.dart';
import 'package:ziya_lottery_app/Prediction_section/models/prediction_model.dart';

class PredictionViewModel extends ChangeNotifier {
  final PredictionService _service = PredictionService();

  // --- UI / prediction state ---
  String featuredTitle = "Kerala Lottery – First Prize";
  String predictedForDay = "Friday";
  List<String> predictionNumbers = [];
  String activePlan = "PLAN 1";

  // --- subscription / plan state ---
  int purchasedPlan = 2;

  // --- generation state ---
  bool _isGenerating = false;
  bool get isGenerating => _isGenerating;
  String? _generatingForPlan;

  bool isGeneratingForPlan(String planName) =>
      _isGenerating && _generatingForPlan == planName;
  bool get hasGeneratedPrediction => predictionNumbers.isNotEmpty;

  // --- selected prediction ---,l,fjdfyhdnjduydoiski
  PredictionModel? selectedPrediction;
  bool _isElitePrize = false;
  bool _isPremiumPrize = false;
  bool _isBasicPrize = false;

  bool get isElitePrize => _isElitePrize;
  bool get isPremiumPrize => _isPremiumPrize;
  bool get isBasicPrize => _isBasicPrize;

  // --- SETTERS ---
  void setSelectedPrediction(PredictionModel prediction) {
    selectedPrediction = prediction;
    _resetPrizeFlags();

    if (prediction.amount == '₹80 Lakh' || prediction.amount == '₹10 Lakh') {
      _isElitePrize = true;
      activePlan = 'PLAN 3';
    } else if (prediction.amount == '₹1 Lakh' || prediction.amount == '₹5,000') {
      _isPremiumPrize = true;
      activePlan = 'PLAN 2';
    } else if (prediction.amount == '₹1,000') {
      _isBasicPrize = true;
      activePlan = 'PLAN 1';
    } else {
      activePlan = 'PLAN 1';
    }

    resetPredictionState();
  }

  void resetPredictionState() {
    predictionNumbers = [];
    _isGenerating = false;
    notifyListeners();
  }

  void updatePlan(String planName) {
    activePlan = planName;
    predictionNumbers = [];
    notifyListeners();
  }

  void setPurchasedPlan(int planIndex) {
    purchasedPlan = planIndex;
    notifyListeners();
  }

  // --- HELPER METHODS ---
  bool canGenerateForActivePlan() {
    if (_isElitePrize) return purchasedPlan >= 3 && activePlan == 'PLAN 3';
    if (_isPremiumPrize) return purchasedPlan >= 2 && activePlan == 'PLAN 2';
    if (_isBasicPrize) return purchasedPlan >= 1 && activePlan == 'PLAN 1';

    final planIndex = _planIndex(activePlan);
    return purchasedPlan >= planIndex && planIndex > 0;
  }

  int _planIndex(String planName) {
    switch (planName.toUpperCase()) {
      case 'PLAN 1':
        return 1;
      case 'PLAN 2':
        return 2;
      case 'PLAN 3':
        return 3;
      default:
        return 0;
    }
  }

  // Public accessor used in PlanTabs — keeps old compatibility.
  int getPlanIndex(String planName) => _planIndex(planName);

  void _resetPrizeFlags() {
    _isElitePrize = _isPremiumPrize = _isBasicPrize = false;
  }

  // --- GENERATE PREDICTION (API-ready) ---
  Future<void> generatePrediction() async {
    if (selectedPrediction == null || !canGenerateForActivePlan()) return;

    _isGenerating = true;
    _generatingForPlan = activePlan;
    predictionNumbers = [];
    notifyListeners();

    final results = await _service.generatePredictions(planName: activePlan);

    if (_generatingForPlan == activePlan) {
      predictionNumbers = results;
    }

    _isGenerating = false;
    _generatingForPlan = null;
    notifyListeners();
  }

  // --- STATIC DATA ---
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

  List<Map<String, String>> get prizeCategories {
    final drawDate = DateFormat('dd MMM yyyy').format(DateTime.now());
    return [
      {"title": "FIRST PRIZE", "amount": "₹80 Lakh", "drawDate": "Draw: $drawDate"},
      {"title": "SECOND PRIZE", "amount": "₹10 Lakh", "drawDate": "Draw: $drawDate"},
      {"title": "THIRD PRIZE", "amount": "₹1 Lakh", "drawDate": "Draw: $drawDate"},
      {"title": "FOURTH PRIZE", "amount": "₹5,000", "drawDate": "Draw: $drawDate"},
      {"title": "FIFTH PRIZE", "amount": "₹1,000", "drawDate": "Draw: $drawDate"},
    ];
  }

  List<Map<String, String>> getPrizesForLottery(String name) =>
      prizeCategories;
}
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:ziya_lottery_app/Home/models/lottery.dart';
// import 'package:ziya_lottery_app/Prediction_section/Service/prediction_service.dart';
// import 'package:ziya_lottery_app/Prediction_section/models/prediction_model.dart';
// import 'package:ziya_lottery_app/subscriptionSection/view_model/subscription_view_model.dart';

// class PredictionViewModel extends ChangeNotifier {
//   final PredictionService _service = PredictionService();
//   final SubscriptionViewModel subscriptionVM;

//   PredictionViewModel({required this.subscriptionVM});

//   // --- UI / prediction state ---
//   String featuredTitle = "Kerala Lottery – First Prize";
//   String predictedForDay = "Friday";
//   List<String> predictionNumbers = [];

//   // --- generation state ---
//   bool _isGenerating = false;
//   bool get isGenerating => _isGenerating;
//   String? _generatingForPlan;

//   bool isGeneratingForPlan(String planName) =>
//       _isGenerating && _generatingForPlan == planName;
//   bool get hasGeneratedPrediction => predictionNumbers.isNotEmpty;

//   // --- selected prediction ---
//   PredictionModel? selectedPrediction;
//   bool _isElitePrize = false;
//   bool _isPremiumPrize = false;
//   bool _isBasicPrize = false;

//   bool get isElitePrize => _isElitePrize;
//   bool get isPremiumPrize => _isPremiumPrize;
//   bool get isBasicPrize => _isBasicPrize;

//   // --- SETTERS ---
//   void setSelectedPrediction(PredictionModel prediction) {
//     selectedPrediction = prediction;
//     _resetPrizeFlags();

//     if (prediction.amount == '₹80 Lakh' || prediction.amount == '₹10 Lakh') {
//       _isElitePrize = true;
//       subscriptionVM.setCurrentPlanId('PLAN3');
//     } else if (prediction.amount == '₹1 Lakh' || prediction.amount == '₹5,000') {
//       _isPremiumPrize = true;
//       subscriptionVM.setCurrentPlanId('PLAN2');
//     } else if (prediction.amount == '₹1,000') {
//       _isBasicPrize = true;
//       subscriptionVM.setCurrentPlanId('PLAN1');
//     } else {
//       subscriptionVM.setCurrentPlanId('PLAN1');
//     }

//     resetPredictionState();
//   }

//   void resetPredictionState() {
//     predictionNumbers = [];
//     _isGenerating = false;
//     notifyListeners();
//   }

//   void updatePlan(String planName) {
//     subscriptionVM.setCurrentPlanId(planName);
//     predictionNumbers = [];
//     notifyListeners();
//   }

//   // --- HELPER METHODS ---
//   bool canGenerateForActivePlan() {
//     final planId = subscriptionVM.currentPlanId;
//     final purchasedLevel = subscriptionVM.purchasedPlan;
//     final planLevel = subscriptionVM.planIdToLevel(planId);

//     if (_isElitePrize) return purchasedLevel >= 3 && planId == 'PLAN3';
//     if (_isPremiumPrize) return purchasedLevel >= 2 && planId == 'PLAN2';
//     if (_isBasicPrize) return purchasedLevel >= 1 && planId == 'PLAN1';

//     return purchasedLevel >= planLevel && planLevel > 0;
//   }

//   void _resetPrizeFlags() {
//     _isElitePrize = _isPremiumPrize = _isBasicPrize = false;
//   }

//   // --- GENERATE PREDICTION (API-ready) ---
//   Future<void> generatePrediction() async {
//     if (selectedPrediction == null || !canGenerateForActivePlan()) return;

//     _isGenerating = true;
//     _generatingForPlan = subscriptionVM.currentPlanId;
//     predictionNumbers = [];
//     notifyListeners();

//     final results = await _service.generatePredictions(
//       planName: subscriptionVM.currentPlanId,
//     );

//     if (_generatingForPlan == subscriptionVM.currentPlanId) {
//       predictionNumbers = results;
//     }

//     _isGenerating = false;
//     _generatingForPlan = null;
//     notifyListeners();
//   }

//   // --- STATIC DATA ---
//   List<LotteryModel> allLotteries = [
//     LotteryModel(
//       name: "Bhagyathara",
//       prizes: 5,
//       iconPath: 'assets/icons/Bhagyathara_icon.png',
//       iconBgColor: Colors.redAccent,
//     ),
//     LotteryModel(
//       name: "Sthree Sakthi",
//       prizes: 5,
//       iconPath: 'assets/icons/Sthree Sakthi_icon.png',
//       iconBgColor: Colors.green,
//     ),
//     LotteryModel(
//       name: "Dhanalekshmi",
//       prizes: 5,
//       iconPath: 'assets/icons/Dhanalekshmi_icon.png',
//       iconBgColor: Colors.blueAccent,
//     ),
//     LotteryModel(
//       name: "Karunya Plus",
//       prizes: 5,
//       iconPath: 'assets/icons/Karunya Plus_icon.png',
//       iconBgColor: Colors.orangeAccent,
//     ),
//   ];

//   List<Map<String, String>> get prizeCategories {
//     final drawDate = DateFormat('dd MMM yyyy').format(DateTime.now());
//     return [
//       {"title": "FIRST PRIZE", "amount": "₹80 Lakh", "drawDate": "Draw: $drawDate"},
//       {"title": "SECOND PRIZE", "amount": "₹10 Lakh", "drawDate": "Draw: $drawDate"},
//       {"title": "THIRD PRIZE", "amount": "₹1 Lakh", "drawDate": "Draw: $drawDate"},
//       {"title": "FOURTH PRIZE", "amount": "₹5,000", "drawDate": "Draw: $drawDate"},
//       {"title": "FIFTH PRIZE", "amount": "₹1,000", "drawDate": "Draw: $drawDate"},
//     ];
//   }

//   List<Map<String, String>> getPrizesForLottery(String name) =>
//       prizeCategories;
// }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:ziya_lottery_app/Home/models/lottery.dart';
// import 'package:ziya_lottery_app/Prediction_section/Service/prediction_service.dart';
// import 'package:ziya_lottery_app/Prediction_section/models/prediction_model.dart';
// import 'package:ziya_lottery_app/subscriptionSection/view_model/subscription_view_model.dart';

// class PredictionViewModel extends ChangeNotifier {
//   final PredictionService _service = PredictionService();
//   final SubscriptionViewModel subscriptionVM;

//   PredictionViewModel({required this.subscriptionVM});

//   String featuredTitle = "Kerala Lottery – First Prize";
//   String predictedForDay = "Friday";
//   List<String> predictionNumbers = [];

//   bool _isGenerating = false;
//   bool get isGenerating => _isGenerating;
//   String? _generatingForPlan;

//   bool isGeneratingForPlan(String planName) =>
//       _isGenerating && _generatingForPlan == subscriptionVM.currentPlanId;
//   bool get hasGeneratedPrediction => predictionNumbers.isNotEmpty;

//   PredictionModel? selectedPrediction;
//   bool _isElitePrize = false;
//   bool _isPremiumPrize = false;
//   bool _isBasicPrize = false;

//   bool get isElitePrize => _isElitePrize;
//   bool get isPremiumPrize => _isPremiumPrize;
//   bool get isBasicPrize => _isBasicPrize;

//   String get activePlan {
//     if (_isElitePrize) return 'PLAN 3';
//     if (_isPremiumPrize) return 'PLAN 2';
//     if (_isBasicPrize) return 'PLAN 1';
//     return subscriptionVM.currentPlanId.replaceFirst('PLAN', 'PLAN ');
//   }

//   void setSelectedPrediction(PredictionModel prediction) {
//     selectedPrediction = prediction;
//     _resetPrizeFlags();

//     if (prediction.amount == '₹80 Lakh' || prediction.amount == '₹10 Lakh') {
//       _isElitePrize = true;
//       subscriptionVM.setCurrentPlanId('PLAN3');
//     } else if (prediction.amount == '₹1 Lakh' || prediction.amount == '₹5,000') {
//       _isPremiumPrize = true;
//       subscriptionVM.setCurrentPlanId('PLAN2');
//     } else if (prediction.amount == '₹1,000') {
//       _isBasicPrize = true;
//       subscriptionVM.setCurrentPlanId('PLAN1');
//     } else {
//       subscriptionVM.setCurrentPlanId('PLAN1');
//     }

//     resetPredictionState();
//   }

//   void resetPredictionState() {
//     predictionNumbers = [];
//     _isGenerating = false;
//     notifyListeners();
//   }

//   void updatePlan(String planName) {
//     subscriptionVM.setCurrentPlanId(planName);
//     predictionNumbers = [];
//     notifyListeners();
//   }

//   bool canGenerateForActivePlan() {
//     final planId = subscriptionVM.currentPlanId;
//     final purchasedLevel = subscriptionVM.purchasedPlan;
//     final planLevel = subscriptionVM.planIdToLevel(planId);

//     if (_isElitePrize) return purchasedLevel >= 3 && planId == 'PLAN3';
//     if (_isPremiumPrize) return purchasedLevel >= 2 && planId == 'PLAN2';
//     if (_isBasicPrize) return purchasedLevel >= 1 && planId == 'PLAN1';

//     return purchasedLevel >= planLevel && planLevel > 0;
//   }

//   void _resetPrizeFlags() {
//     _isElitePrize = _isPremiumPrize = _isBasicPrize = false;
//   }

//   Future<void> generatePrediction() async {
//     if (selectedPrediction == null || !canGenerateForActivePlan()) return;

//     _isGenerating = true;
//     _generatingForPlan = subscriptionVM.currentPlanId;
//     predictionNumbers = [];
//     notifyListeners();

//     final results = await _service.generatePredictions(
//       planName: subscriptionVM.currentPlanId,
//     );

//     if (_generatingForPlan == subscriptionVM.currentPlanId) {
//       predictionNumbers = results;
//     }

//     _isGenerating = false;
//     _generatingForPlan = null;
//     notifyListeners();
//   }

//   List<LotteryModel> allLotteries = [
//     LotteryModel(
//       name: "Bhagyathara",
//       prizes: 5,
//       iconPath: 'assets/icons/Bhagyathara_icon.png',
//       iconBgColor: Colors.redAccent,
//     ),
//     LotteryModel(
//       name: "Sthree Sakthi",
//       prizes: 5,
//       iconPath: 'assets/icons/Sthree Sakthi_icon.png',
//       iconBgColor: Colors.green,
//     ),
//     LotteryModel(
//       name: "Dhanalekshmi",
//       prizes: 5,
//       iconPath: 'assets/icons/Dhanalekshmi_icon.png',
//       iconBgColor: Colors.blueAccent,
//     ),
//     LotteryModel(
//       name: "Karunya Plus",
//       prizes: 5,
//       iconPath: 'assets/icons/Karunya Plus_icon.png',
//       iconBgColor: Colors.orangeAccent,
//     ),
//   ];

//   List<Map<String, String>> get prizeCategories {
//     final drawDate = DateFormat('dd MMM yyyy').format(DateTime.now());
//     return [
//       {"title": "FIRST PRIZE", "amount": "₹80 Lakh", "drawDate": "Draw: $drawDate"},
//       {"title": "SECOND PRIZE", "amount": "₹10 Lakh", "drawDate": "Draw: $drawDate"},
//       {"title": "THIRD PRIZE", "amount": "₹1 Lakh", "drawDate": "Draw: $drawDate"},
//       {"title": "FOURTH PRIZE", "amount": "₹5,000", "drawDate": "Draw: $drawDate"},
//       {"title": "FIFTH PRIZE", "amount": "₹1,000", "drawDate": "Draw: $drawDate"},
//     ];
//   }

//   List<Map<String, String>> getPrizesForLottery(String name) =>
//       prizeCategories;
// }
