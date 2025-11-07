import 'package:flutter/material.dart';
import '../model/plan_model.dart';

class SubscriptionViewModel extends ChangeNotifier {
  int _purchasedPlan = 3;
  int get purchasedPlan => _purchasedPlan;

  String _currentPlanId = 'PLAN3';
  String get currentPlanId => _currentPlanId;

  final List<Plan> plans = [
    Plan(
      id: 'PLAN1',
      title: 'Basic Plan',
      subtitle: 'Get started with basic predictions',
      price: '\$99',
      duration: '/month',
      accentColor: Colors.blue,
      icon: Icons.auto_awesome,
      features: [
        '7th, 8th & 9th Prizes Only',
        '15 Numbers per Prediction',
        'Prediction Percentage Display',
        'Multi-Prize Analytics',
        'Hot & Cold Number Indicators',
        'Basic History Analytics',
        'Access to Basic Support',
      ],
    ),
    Plan(
      id: 'PLAN2',
      title: 'Premium Plan',
      subtitle: 'Advanced predictions with higher accuracy',
      price: '\$299',
      duration: '/month',
      accentColor: Colors.amber,
      icon: Icons.workspace_premium_outlined,
      features: [
        'Predict 4th to 9th Prizes',
        '30 Numbers per Prediction',
        'Prediction Percentage Display',
        'Multi-Prize Analytics (trend)',
        'Hot & Cold Number Indicators',
        'Priority Notifications',
        'Recommended for regular players',
      ],
    ),
    Plan(
      id: 'PLAN3',
      title: 'Elite Plan',
      subtitle: 'All-inclusive elite predictions and analytics',
      price: '\$599',
      duration: '/month',
      accentColor: Colors.green,
      icon: Icons.shield_outlined,
      features: [
        'Predict 1st to 9th Prizes (All Prizes Unlocked)',
        '50 Numbers per Prediction',
        'Advanced AI Pattern Analysis',
        'Winning number frequency charts',
        'Monthly performance reports',
        'Exclusive special draw tips',
        'Higher success optimization tools enabled',
        'Priority customer support',
      ],
    ),
  ];

  void setPurchasedPlan(int level) {
    _purchasedPlan = level;
    notifyListeners();
  }

  void setCurrentPlanId(String id) {
    _currentPlanId = id;
    notifyListeners();
  }

  int planIdToLevel(String id) {
    switch (id) {
      case 'PLAN1':
        return 1;
      case 'PLAN2':
        return 2;
      case 'PLAN3':
        return 3;
      default:
        return 0;
    }
  }

  bool canAccessPlan(String planId) {
    final level = planIdToLevel(planId);
    return _purchasedPlan >= level;
  }
}
