import 'package:flutter/material.dart';
import '../model/privacy_policy_model.dart';

class PrivacyPolicyViewModel extends ChangeNotifier {
  final List<PrivacyPolicyModel> _policyList = [];

  List<PrivacyPolicyModel> get policyList => _policyList;

  PrivacyPolicyViewModel() {
    _loadPolicies();
  }

  void _loadPolicies() {
    _policyList.addAll([
      PrivacyPolicyModel(
        title: "1. What data we collect?",
        content:
            "• Name, email, phone, usage analytics\n• Device & app logs (improve prediction quality).",
      ),
      PrivacyPolicyModel(
        title: "2. Why we collect it?",
        content:
            "• To provide predictions and notifications\n• To manage subscription services\n• To improve accuracy and app performance",
      ),
      PrivacyPolicyModel(
        title: "3. Data protection",
        content: "• Encrypted secure storage\n• No sale of personal data",
      ),
      PrivacyPolicyModel(
        title: "4. Third-party services",
        content: "• Payment provider\n• Analytics tools",
      ),
      PrivacyPolicyModel(
        title: "5. User rights",
        content: "• Download your data\n• Request account deletion",
      ),
      PrivacyPolicyModel(
        title: "6. Cookies & local storage usage",
        content:
            "We use cookies and local storage to remember your preferences, maintain your login session, and improve app functionality.",
      ),
      PrivacyPolicyModel(
        title: "7. Contact info for privacy requests",
        content:
            "For any privacy-related questions or data requests, please contact us at:",
      ),
    ]);
  }
}
