// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Home/models/lottery.dart';
// import 'package:intl/intl.dart';
// import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';
// import 'package:ziya_lottery_app/Prediction_section/Service/prediction_service.dart';
// import 'package:ziya_lottery_app/Prediction_section/models/prediction_model.dart';

// class PredictionViewModel extends ChangeNotifier {
//   final PredictionService _service = PredictionService();
//   final homeVM = Provider.of<HomeViewModel>(context, listen: false);
// homeVM.markPredictedToday(true);

//   // --- UI / prediction state ---
//   String featuredTitle = "Kerala Lottery – First Prize";
//   String predictedForDay = "Friday";
//   List<String> predictionNumbers = [];
//   String activePlan = "PLAN 1";

//   // --- subscription / plan state ---
//   int purchasedPlan = 2;

//   // --- generation state ---
//   bool _isGenerating = false;
//   bool get isGenerating => _isGenerating;
//   String? _generatingForPlan;

//   bool isGeneratingForPlan(String planName) =>
//       _isGenerating && _generatingForPlan == planName;
//   bool get hasGeneratedPrediction => predictionNumbers.isNotEmpty;

//   // --- selected prediction ---,l,fjdfyhdnjduydoiski
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
//       activePlan = 'PLAN 3';
//     } else if (prediction.amount == '₹1 Lakh' ||
//         prediction.amount == '₹5,000') {
//       _isPremiumPrize = true;
//       activePlan = 'PLAN 2';
//     } else if (prediction.amount == '₹1,000') {
//       _isBasicPrize = true;
//       activePlan = 'PLAN 1';
//     } else {
//       activePlan = 'PLAN 1';
//     }

//     resetPredictionState();
//   }

//   void resetPredictionState() {
//     predictionNumbers = [];
//     _isGenerating = false;
//     notifyListeners();
//   }

//   void updatePlan(String planName) {
//     activePlan = planName;
//     predictionNumbers = [];
//     notifyListeners();
//   }

//   void setPurchasedPlan(int planIndex) {
//     purchasedPlan = planIndex;
//     notifyListeners();
//   }

//   // --- HELPER METHODS ---
//   bool canGenerateForActivePlan() {
//     if (_isElitePrize) return purchasedPlan >= 3 && activePlan == 'PLAN 3';
//     if (_isPremiumPrize) return purchasedPlan >= 2 && activePlan == 'PLAN 2';
//     if (_isBasicPrize) return purchasedPlan >= 1 && activePlan == 'PLAN 1';

//     final planIndex = _planIndex(activePlan);
//     return purchasedPlan >= planIndex && planIndex > 0;
//   }

//   int _planIndex(String planName) {
//     switch (planName.toUpperCase()) {
//       case 'PLAN 1':
//         return 1;
//       case 'PLAN 2':
//         return 2;
//       case 'PLAN 3':
//         return 3;
//       default:
//         return 0;
//     }
//   }

//   // Public accessor used in PlanTabs — keeps old compatibility.
//   int getPlanIndex(String planName) => _planIndex(planName);

//   void _resetPrizeFlags() {
//     _isElitePrize = _isPremiumPrize = _isBasicPrize = false;
//   }

//   // --- GENERATE PREDICTION (API-ready) ---
//   Future<void> generatePrediction() async {
//     if (selectedPrediction == null || !canGenerateForActivePlan()) return;

//     _isGenerating = true;
//     _generatingForPlan = activePlan;
//     predictionNumbers = [];
//     notifyListeners();
//     markPredictedToday() ;

// }

//     final results = await _service.generatePredictions(planName: activePlan);

//     if (_generatingForPlan == activePlan) {
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
//       {
//         "title": "FIRST PRIZE",
//         "amount": "₹80 Lakh",
//         "drawDate": "Draw: $drawDate",
//       },
//       {
//         "title": "SECOND PRIZE",
//         "amount": "₹10 Lakh",
//         "drawDate": "Draw: $drawDate",
//       },
//       {
//         "title": "THIRD PRIZE",
//         "amount": "₹1 Lakh",
//         "drawDate": "Draw: $drawDate",
//       },
//       {
//         "title": "FOURTH PRIZE",
//         "amount": "₹5,000",
//         "drawDate": "Draw: $drawDate",
//       },
//       {
//         "title": "FIFTH PRIZE",
//         "amount": "₹1,000",
//         "drawDate": "Draw: $drawDate",
//       },
//     ];
//   }

//   List<Map<String, String>> getPrizesForLottery(String name) => prizeCategories;
// }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:ziya_lottery_app/Home/models/lottery.dart';
// import 'package:ziya_lottery_app/Prediction_section/Service/prediction_service.dart';
// import 'package:ziya_lottery_app/Prediction_section/models/prediction_model.dart';
// import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';

// class PredictionViewModel extends ChangeNotifier {
//   final PredictionService _service = PredictionService();

//   // Inject HomeViewModel later (not directly in constructor)
//   late HomeViewModel _homeVM;
//   void init(HomeViewModel homeVM) {
//     _homeVM = homeVM;
//   }

//   // --- UI / prediction state ---
//   String featuredTitle = "Kerala Lottery – First Prize";
//   String predictedForDay = "Friday";
//   List<String> predictionNumbers = [];
//   String activePlan = "PLAN 1";

//   // --- subscription / plan state ---
//   int purchasedPlan = 2;

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
//       activePlan = 'PLAN 3';
//     } else if (prediction.amount == '₹1 Lakh' ||
//         prediction.amount == '₹5,000') {
//       _isPremiumPrize = true;
//       activePlan = 'PLAN 2';
//     } else if (prediction.amount == '₹1,000') {
//       _isBasicPrize = true;
//       activePlan = 'PLAN 1';
//     } else {
//       activePlan = 'PLAN 1';
//     }

//     resetPredictionState();
//   }

//   void resetPredictionState() {
//     predictionNumbers = [];
//     _isGenerating = false;
//     notifyListeners();
//   }

//   void updatePlan(String planName) {
//     activePlan = planName;
//     predictionNumbers = [];
//     notifyListeners();
//   }

//   void setPurchasedPlan(int planIndex) {
//     purchasedPlan = planIndex;
//     notifyListeners();
//   }

//   // --- HELPER METHODS ---
//   bool canGenerateForActivePlan() {
//     if (_isElitePrize) return purchasedPlan >= 3 && activePlan == 'PLAN 3';
//     if (_isPremiumPrize) return purchasedPlan >= 2 && activePlan == 'PLAN 2';
//     if (_isBasicPrize) return purchasedPlan >= 1 && activePlan == 'PLAN 1';

//     final planIndex = _planIndex(activePlan);
//     return purchasedPlan >= planIndex && planIndex > 0;
//   }

//   int _planIndex(String planName) {
//     switch (planName.toUpperCase()) {
//       case 'PLAN 1':
//         return 1;
//       case 'PLAN 2':
//         return 2;
//       case 'PLAN 3':
//         return 3;
//       default:
//         return 0;
//     }
//   }

//   int getPlanIndex(String planName) => _planIndex(planName);

//   void _resetPrizeFlags() {
//     _isElitePrize = _isPremiumPrize = _isBasicPrize = false;
//   }

//   // --- GENERATE PREDICTION ---
//   Future<void> generatePrediction() async {
//     if (selectedPrediction == null || !canGenerateForActivePlan()) return;

//     _isGenerating = true;
//     _generatingForPlan = activePlan;
//     predictionNumbers = [];
//     notifyListeners();

//     final results = await _service.generatePredictions(planName: activePlan);

//     if (_generatingForPlan == activePlan) {
//       predictionNumbers = results;
//       _homeVM.mark(true);
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
//       {
//         "title": "FIRST PRIZE",
//         "amount": "₹80 Lakh",
//         "drawDate": "Draw: $drawDate",
//       },
//       {
//         "title": "SECOND PRIZE",
//         "amount": "₹10 Lakh",
//         "drawDate": "Draw: $drawDate",
//       },
//       {
//         "title": "THIRD PRIZE",
//         "amount": "₹1 Lakh",
//         "drawDate": "Draw: $drawDate",
//       },
//       {
//         "title": "FOURTH PRIZE",
//         "amount": "₹5,000",
//         "drawDate": "Draw: $drawDate",
//       },
//       {
//         "title": "FIFTH PRIZE",
//         "amount": "₹1,000",
//         "drawDate": "Draw: $drawDate",
//       },
//     ];
//   }

//   List<Map<String, String>> getPrizesForLottery(String name) => prizeCategories;
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';
import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';
import 'package:ziya_lottery_app/Prediction_section/Service/prediction_service.dart';
import 'package:ziya_lottery_app/Prediction_section/models/prediction_model.dart';

class PredictionViewModel extends ChangeNotifier {
  final PredictionService _service = PredictionService();

  late HomeViewModel _homeVM;

  // ✅ Call this once when initializing
  void init(HomeViewModel homeVM) {
    _homeVM = homeVM;
  }

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

  // --- selected prediction ---
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
    } else if (prediction.amount == '₹1 Lakh' ||
        prediction.amount == '₹5,000') {
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

  int getPlanIndex(String planName) => _planIndex(planName);

  void _resetPrizeFlags() {
    _isElitePrize = _isPremiumPrize = _isBasicPrize = false;
  }

  // --- GENERATE PREDICTION ---
  Future<void> generatePrediction() async {
    if (selectedPrediction == null || !canGenerateForActivePlan()) return;

    _isGenerating = true;
    _generatingForPlan = activePlan;
    predictionNumbers = [];
    notifyListeners();

    final results = await _service.generatePredictions(planName: activePlan);

    if (_generatingForPlan == activePlan) {
      predictionNumbers = results;
      _homeVM.markPredictedToday(true); // ✅ properly linked
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
      {
        "title": "FIRST PRIZE",
        "amount": "₹80 Lakh",
        "drawDate": "Draw: $drawDate",
      },
      {
        "title": "SECOND PRIZE",
        "amount": "₹10 Lakh",
        "drawDate": "Draw: $drawDate",
      },
      {
        "title": "THIRD PRIZE",
        "amount": "₹1 Lakh",
        "drawDate": "Draw: $drawDate",
      },
      {
        "title": "FOURTH PRIZE",
        "amount": "₹5,000",
        "drawDate": "Draw: $drawDate",
      },
      {
        "title": "FIFTH PRIZE",
        "amount": "₹1,000",
        "drawDate": "Draw: $drawDate",
      },
    ];
  }

  List<Map<String, String>> getPrizesForLottery(String name) => prizeCategories;
}
