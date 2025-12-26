import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Notification/models/notification_model.dart';
import '../../../../Constants/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onDelete;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22.r,
          backgroundColor: AppColors.primaryBlue,
          child: Text(
            notification.senderInitials,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        subtitle: notification.message.isNotEmpty
            ? Text(
                notification.message,
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
              )
            : null,
        trailing: Text(
          notification.timeAgo,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.h),
      ),
    );
  }
}
