
// import 'package:flutter/material.dart' show ChangeNotifier;
// import 'package:ziya_lottery_app/Result/lottery_result_model.dart';


// class LotteryViewModel extends ChangeNotifier {
//   bool _showAdView = true;
//   String _selectedNumber = '';
//   DateTime? _selectedDate;
//   final List<LotteryResult> _results = [];

//   bool get showAdView => _showAdView;
//   String get selectedNumber => _selectedNumber;
//   DateTime? get selectedDate => _selectedDate;
//   List<LotteryResult> get results => _results;

//   void showResults() {
//     _showAdView = false;
//     notifyListeners();
//   }

//   void showAd() {
//     _showAdView = true;
//     notifyListeners();
//   }

//   void updateSearchNumber(String number) {
//     _selectedNumber = number;
//   }

//   void updateSearchDate(DateTime date) {
//     _selectedDate = date;
//   }

//   void fetchResults() {
//     // Example static data
//     _results.clear();
//     _results.addAll([
//       LotteryResult(
//           prizeTitle: 'First Prize',
//           number: 'DY86758',
//           location: 'PAYYANNUR',
//           amount: '1,00,000.00'),
//       LotteryResult(
//           prizeTitle: 'Second Prize',
//           number: 'DY86758',
//           location: 'MALLAPPURAM',
//           amount: '30,00,000.00'),
//       LotteryResult(
//           prizeTitle: 'Third Prize',
//           number: 'DY86758',
//           location: 'GURUVAYOOR',
//           amount: '5,00,000.00'),
//     ]);
//     notifyListeners();
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import '../lottery_result_model.dart';

class LotteryViewModel extends ChangeNotifier {
  bool _showAdView = true;
  String _selectedNumber = '';
  DateTime? _selectedDate;

  // Ad URL (can be replaced by API value later)
  String _adImageUrl =
      'https://t4.ftcdn.net/jpg/14/95/32/85/360_F_1495328506_JkFdUwgebhL5wM1wbLA7iwGmDFYoMjxV.jpg';

  final List<LotteryResult> _results = [];

  bool get showAdView => _showAdView;
  String get selectedNumber => _selectedNumber;
  DateTime? get selectedDate => _selectedDate;
  List<LotteryResult> get results => List.unmodifiable(_results);
  String get adImageUrl => _adImageUrl;

  void showResults() {
    _showAdView = false;
    notifyListeners();
  }

  void showAd() {
    _showAdView = true;
    notifyListeners();
  }

  void updateSearchNumber(String number) {
    _selectedNumber = number;
    notifyListeners();
  }

  void updateSearchDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  /// Simulate fetching results (use real API call here later).
  Future<void> fetchResults() async {
    // simulate network delay
    await Future.delayed(const Duration(milliseconds: 400));
    _results.clear();
    _results.addAll([
      LotteryResult(
        prizeTitle: '1st Prize',
        number: 'DY86758',
        location: 'PAYYANNUR',
        amount: '1,00,000.00',
      ),
      LotteryResult(
        prizeTitle: '2nd Prize',
        number: 'DY86758',
        location: 'MALLAPPURAM',
        amount: '30,00,000.00',
      ),
      LotteryResult(
        prizeTitle: '3rd Prize',
        number: 'DY86758',
        location: 'GURUVAYOOR',
        amount: '5,00,000.00',
      ),
    ]);
    notifyListeners();
  }

  /// Allows replacing ad image URL (for dynamic behavior later)
  void setAdImageUrl(String url) {
    _adImageUrl = url;
    notifyListeners();
  }
}
