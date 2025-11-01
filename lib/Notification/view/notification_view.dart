import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';
import 'package:ziya_lottery_app/Notification/view_models/notification_vm.dart';
import 'package:ziya_lottery_app/Notification/widgets/notification_card.dart';
import 'package:ziya_lottery_app/Notification/models/notification_model.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            AppStrings.notificationTitle,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.iconColor,
              size: 18.sp,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Consumer<NotificationViewModel>(
              builder: (context, vm, _) {
                if (vm.notifications.isEmpty) return const SizedBox.shrink();
                return PopupMenuButton<String>(
                  color: AppColors.background,
                  icon: Icon(Icons.more_horiz, color: AppColors.iconColor),
                  onSelected: (value) {
                    if (value == AppStrings.deleteAllKey) {
                      _confirmDeleteAll(context, vm);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem<String>(
                      value: AppStrings.deleteAllKey,
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline, color: AppColors.errorRed),
                          SizedBox(width: 10.w),
                          Text(
                            AppStrings.deleteAll,
                            style: TextStyle(color: AppColors.errorRed),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        body: Consumer<NotificationViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (vm.notifications.isEmpty) {
              return Center(
                child: Text(
                  AppStrings.noNotifications,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                  ),
                ),
              );
            }

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              children: _buildNotificationGroups(context, vm),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildNotificationGroups(
    BuildContext context,
    NotificationViewModel vm,
  ) {
    final Map<String, List<NotificationModel>> grouped = {};

    for (var n in vm.notifications) {
      grouped.putIfAbsent(n.dateGroup, () => []).add(n);
    }

    final List<Widget> notificationGroups = [];

    for (var entry in grouped.entries) {
      notificationGroups.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              entry.key,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 10.h),
            ...entry.value.map(
              (n) => NotificationCard(
                notification: n,
                onDelete: () {
                  final deleted = n;
                  vm.deleteNotification(deleted.id);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _showUndoSnackbar(context, vm, deleted);
                  });
                },
              ),
            ),
          ],
        ),
      );
    }

    if (notificationGroups.isNotEmpty) {
      notificationGroups.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Center(
            child: Text(
              AppStrings.allNotificationsMessage,
              style: TextStyle(color: AppColors.textTertiary, fontSize: 13.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return notificationGroups;
  }

  void _showUndoSnackbar(
    BuildContext context,
    NotificationViewModel vm,
    NotificationModel deletedNotification,
  ) {
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        content: Text(
          AppStrings.oneDeleted,
          style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
        ),
        action: SnackBarAction(
          label: AppStrings.undo,
          textColor: AppColors.primary,
          onPressed: () => vm.restoreNotification(deletedNotification),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _confirmDeleteAll(BuildContext context, NotificationViewModel vm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        title: Text(
          AppStrings.confirmDeleteTitle,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          AppStrings.confirmDeleteMessage,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              AppStrings.cancel,
              style: TextStyle(color: AppColors.primary, fontSize: 14.sp),
            ),
          ),
          TextButton(
            onPressed: () {
              vm.deleteAll();
              Navigator.pop(context);
              _scaffoldMessengerKey.currentState?.showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.background,
                  content: Text(
                    AppStrings.allDeletedMessage,
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            child: Text(
              AppStrings.deleteAll,
              style: TextStyle(color: AppColors.errorRed),
            ),
          ),
        ],
      ),
    );
  }
}
