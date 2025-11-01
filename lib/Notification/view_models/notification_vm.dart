import 'package:flutter/material.dart';
import 'package:ziya_lottery_app/Notification/models/notification_model.dart';

class NotificationViewModel extends ChangeNotifier {
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;

  List<NotificationModel> get notifications => _notifications;
  bool get isLoading => _isLoading;

  NotificationViewModel() {
    loadNotifications();
  }

  void loadNotifications() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    _notifications = [
      NotificationModel(
        id: '1',
        title: "Your prediction for Today’s Akshaya lottery is ready",
        message: "",
        timeAgo: "3 hours ago",
        dateGroup: "Today",
        senderInitials: "PA",
      ),
      NotificationModel(
        id: '2',
        title: "Nirmal Lottery results published — check now",
        message: "",
        timeAgo: "5 hours ago",
        dateGroup: "Today",
        senderInitials: "RS",
      ),
      NotificationModel(
        id: '3',
        title: "Your premium plan expires in 2 days",
        message: "",
        timeAgo: "3 hours ago",
        dateGroup: "Yesterday",
        senderInitials: "SB",
      ),
      NotificationModel(
        id: '4',
        title: "App updates & new features",
        message: "Tips for using predictions",
        timeAgo: "5 hours ago",
        dateGroup: "Yesterday",
        senderInitials: "IU",
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }

  void deleteNotification(String id) {
    _notifications.removeWhere((n) => n.id == id);
    notifyListeners();
  }

  void restoreNotification(NotificationModel notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void deleteAll() {
    _notifications.clear();
    notifyListeners();
  }
}
