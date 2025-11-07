class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String timeAgo;
  final String dateGroup; // e.g., "Today" or "Yesterday"
  final String senderInitials;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.dateGroup,
    required this.senderInitials,
    this.isRead = false,
  });
}
