import 'package:flutter/material.dart';
import '../models/faq_model.dart';

class HelpSupportViewModel extends ChangeNotifier {
  final Map<String, List<FAQModel>> _sections = {};

  Map<String, List<FAQModel>> get sections => _sections;

  HelpSupportViewModel() {
    _loadFAQs();
  }

  void _loadFAQs() {
    _sections.clear();

    _sections.addAll({
      "📘 General Help": [
        FAQModel(
          title: "How to use predictions?",
          content: """
Our app provides Top recommended numbers for each prize category in upcoming Kerala Lottery draws.

Simply:
• Choose today’s draw name (e.g., Akshaya, Nirmal)
• View predictions separated by prize level
• Save the numbers you want to track
• Come back later to check if any matched the results

Predictions are probability-based suggestions, not guaranteed results. Use them wisely and responsibly.
""",
        ),
        FAQModel(
          title: "What is the confidence percentage?",
          content: """
Confidence (%) tells you how likely a predicted number is to appear based on past data patterns.

Example:
If a number shows 76% confidence, it means historically, similar pattern numbers have a higher chance of appearing.
Higher % = stronger pattern + better probability.
""",
        ),
        FAQModel(
          title: "What are hot/cold number statistics?",
          content: """
Hot numbers → appear frequently in recent draws
Cold numbers → rare or not appearing recently

We analyze:
• Last digit patterns
• Repeated number trends
• Positional digit frequency
• Gap between occurrences

Hot → more recent momentum
Cold → potential “due” for appearance
""",
        ),
        FAQModel(
          title: "How are predictions generated?",
          content: """
Predictions are created using *multiple models working together*:

✅ Statistical analysis (hot/cold trends, repeated digit patterns)
✅ Machine learning models trained on past draw data
✅ Markov chain probability modeling for number transitions
✅ Ensemble scoring for better accuracy

We never claim guarantees — predictions are best-guess intelligence based on history.
""",
        ),
      ],

      "🔐 Account Support": [
        FAQModel(
          title: "Login/Account recovery",
          content: """
If you forgot your password:
→ Tap “Forgot Password” on login screen
→ Enter registered mobile/email
→ Receive OTP to reset password

If login fails:
→ Check internet connection
→ Confirm correct email/mobile
→ Contact support if issue continues
""",
        ),
        FAQModel(
          title: "Update profile details",
          content: """
You can update name, email, phone number anytime:

Go to:
➡️ Settings → Account → Edit Profile  
Update → Save changes ✅

Mobile number updates may require OTP verification.
""",
        ),
        FAQModel(
          title: "Delete account",
          content: """
We’re sorry to see you go 😔  
To permanently delete your account:
Settings → Account → Delete Account

Your data (profile, predictions, purchase history) will be removed.  
You may need to verify via OTP for security reasons.

Note: Some financial records may be retained for legal compliance.
""",
        ),
      ],

      "💳 Payment & Subscription": [
        FAQModel(
          title: "How to upgrade plans?",
          content: """
Upgrade anytime:
Settings → Subscription → Choose Plan  
Pay securely using:
• UPI
• Debit/Credit Card
• Net Banking
• Wallets

Premium unlocks:
✅ Full predictions
✅ Confidence %
✅ Daily alerts
✅ Advanced statistics
""",
        ),
        FAQModel(
          title: "Refund policy",
          content: """
Digital subscription fees are non-refundable once activated.

Refunds may be considered only if:
• You were charged but didn’t receive features
• Duplicate payment occurred

Contact support with:
• Transaction ID
• Screenshot
• Registered mobile

We’ll review and respond within 3–5 business days.
""",
        ),
      ],
    });

    notifyListeners();
  }

  void toggleExpansion(String section, int index) {
    final faq = _sections[section]![index];
    faq.isExpanded = !faq.isExpanded;
    notifyListeners();
  }
}
