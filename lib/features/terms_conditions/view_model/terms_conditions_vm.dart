import 'package:flutter/material.dart';
import '../model/terms_model.dart';

class TermsConditionsViewModel extends ChangeNotifier {
  final List<TermsModel> _termsList = [];

  List<TermsModel> get termsList => _termsList;

  TermsConditionsViewModel() {
    _loadTerms();
  }

  void _loadTerms() {
    _termsList.addAll([
      TermsModel(
        text: "You can use predictions for personal entertainment only.",
      ),
      TermsModel(text: "No guarantee of winning results."),
      TermsModel(text: "Users must be 18+."),
      TermsModel(text: "Kerala Lottery rules and government guidelines apply."),
      TermsModel(text: "Predictions are probabilistic — success varies."),
      TermsModel(
        text: "Subscription fees are for app features, not gambling profits.",
      ),
      TermsModel(text: "No liability for financial losses due to results."),
      TermsModel(text: "Do not misuse the app for illegal betting/gambling."),
      TermsModel(text: "We reserve rights to update features and conditions."),
      TermsModel(text: "Account may be terminated for fraud or abuse."),
    ]);
  }
}
