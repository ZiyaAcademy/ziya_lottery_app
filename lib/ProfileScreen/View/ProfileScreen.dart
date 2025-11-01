import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_header.dart';
import 'package:ziya_lottery_app/subscriptionSection/view/subscription_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 300.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 300.h,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          SizedBox(height: 110.h),
                          _buildInfoSection(vm),
                          _buildSettingsSection(vm),
                          _buildMoreSection(vm),
                          _buildLogoutButton(context, vm),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 350.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    GradientHeader(
                      child: SafeArea(
                        bottom: false,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 10.h,
                              ),
                              child: Row(
                                children: [
                                
                                  SizedBox(width: 6.w),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            CircleAvatar(
                              radius: 38.r,
                              backgroundImage: NetworkImage(vm.profileImageUrl),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              vm.userName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              vm.phoneNumber,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 70.h),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -30.0.h,
                      left: 16.w,
                      right: 16.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.workspace_premium,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  "Current Plan",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: vm.isActivePlan
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    vm.isActivePlan ? "Active" : "Inactive",
                                    style: TextStyle(
                                      color: vm.isActivePlan
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              vm.planName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10.h),
                        OutlinedButton(
  style: OutlinedButton.styleFrom(
    minimumSize: Size(double.infinity, 34.h),
    side: BorderSide(
      color: Colors.blue.shade600,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
    ),
  ),
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SubscriptionScreen(),
      ),
    );
  },
  child: Text(
    "Upgrade Plan",
    style: TextStyle(
      color: Colors.blue.shade700,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
    ),
  ),
),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // --- SECTIONS BELOW UNCHANGED ---

  Widget _buildInfoSection(ProfileViewModel vm) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [
          _buildInfoCard(Icons.person, "Name", vm.userName),
          _buildInfoCard(Icons.location_on, "Location", vm.location),
          _buildInfoCard(Icons.phone, "Phone number", vm.phoneNumber),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 20.w),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textColorDark,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: AppColors.textColorDark.withOpacity(0.8),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(ProfileViewModel vm) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("Settings"),
          _buildSettingTile(Icons.notifications, "Notifications", () {}),
          _buildLanguageTile(vm),
          _buildSettingTile(Icons.lock, "Change Password", () {}),
        ],
      ),
    );
  }

  Widget _buildMoreSection(ProfileViewModel vm) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("More"),
          _buildSettingTile(Icons.history, "Prediction History", () {}),
          _buildSettingTile(Icons.help_outline, "Help & Support", () {}),
          _buildSettingTile(Icons.article, "Terms & Conditions", () {}),
          _buildSettingTile(Icons.privacy_tip, "Privacy & Policy", () {}),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context, ProfileViewModel vm) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: ElevatedButton.icon(
        onPressed: () => vm.logout(context),
        icon: const Icon(Icons.logout, color: Colors.red),
        label: Text(
          "Logout",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          fixedSize: Size(180.w, 45.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
          side: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: Text(
      title,
      style: TextStyle(
        color: AppColors.textColorDark,
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    ),
  );

  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryBlue, size: 22.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textColorDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile(ProfileViewModel vm) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.language, color: AppColors.primaryBlue, size: 22.w),
      title: const Text("Language"),
      trailing: DropdownButton<String>(
        dropdownColor: Colors.white,
        value: vm.language,
        underline: const SizedBox(),
        items: const [
          DropdownMenuItem(value: "English", child: Text("English")),
          DropdownMenuItem(value: "Malayalam", child: Text("മലയാളം")),
          DropdownMenuItem(value: "Hindi", child: Text("हिंदी")),
          DropdownMenuItem(value: "Tamil", child: Text("தமிழ்")),
        ],
        onChanged: (value) {
          if (value != null) vm.changeLanguage(value);
        },
      ),
    );
  }
}
