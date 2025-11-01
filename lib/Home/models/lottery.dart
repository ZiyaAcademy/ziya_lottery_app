import 'package:flutter/material.dart';

class WinnerModel {
  final String name;
  final String lotteryName;
  final String ticketNumber;
  final String location;
  final String prediction;
  final String dateWon;

  WinnerModel({
    required this.name,
    required this.lotteryName,
    required this.ticketNumber,
    required this.location,
    required this.prediction,
    required this.dateWon,
  });
}

class LotteryModel {
  final String name;
  final int prizes;
  final String iconPath;
  final Color iconBgColor;

  LotteryModel({
    required this.name,
    required this.prizes,
    required this.iconPath,
    required this.iconBgColor,
  });
}
