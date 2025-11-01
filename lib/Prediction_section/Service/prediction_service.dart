import 'dart:async';

class PredictionService {
  Future<List<String>> generatePredictions({required String planName}) async {
    // 🔄 Replace with API call (POST /generatePrediction)
    await Future.delayed(const Duration(seconds: 3));
    return ['8123', '4567', '9876', '3459']; // mock data
  }
}
