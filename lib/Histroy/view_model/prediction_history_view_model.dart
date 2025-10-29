import 'package:flutter/material.dart';
import '../model/prediction_model.dart';

class PredictionHistoryViewModel extends ChangeNotifier {
  // Initial sample data (matches the screenshot)
  final List<PredictionModel> _allPredictions = [
    PredictionModel(
      title: 'Bhagyathara',
      date: '25-10-2025',
      prize: '1st prize',
      plan: 'Plan 3',
      result: 'No Match',
      status: 'Completed',
      ticketNumber: 'WN 432556',
    ),
    PredictionModel(
      title: 'Sthree Sakthi',
      date: '25-10-2025',
      prize: '2nd prize',
      plan: 'Plan 3',
      result: 'No Match',
      status: 'Completed',
      ticketNumber: 'AK 789234',
    ),
    PredictionModel(
      title: 'Karunya Plus',
      date: '25-10-2025',
      prize: '1st prize',
      plan: 'Plan 3',
      result: 'Close Match',
      status: 'Completed',
      ticketNumber: 'KR 567890',
    ),
    PredictionModel(
      title: 'Dhanalekshmi',
      date: '25-10-2025',
      prize: 'Consolation',
      plan: 'Plan 1',
      result: 'Pending',
      status: 'Pending',
      ticketNumber: 'IN 234567',
    ),
  ];

  String _selectedTab = 'ALL'; // default

  List<PredictionModel> get predictions {
    if (_selectedTab == 'ALL') return List.unmodifiable(_allPredictions);
    return List.unmodifiable(
      _allPredictions.where((p) => p.status == _selectedTab),
    );
  }

  String get selectedTab => _selectedTab;

  void setTab(String tab) {
    if (_selectedTab == tab) return;
    _selectedTab = tab;
    notifyListeners();
  }

  // optional helpers for adding/removing in future
  void addPrediction(PredictionModel model) {
    _allPredictions.insert(0, model);
    notifyListeners();
  }

  void clear() {
    _allPredictions.clear();
    notifyListeners();
  }
}
