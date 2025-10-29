// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Constants/app_strings.dart';
// import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<ProfileViewModel>(context);

//     return Scaffold(
//       backgroundColor: AppColors.backgroundGrey,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 height: 200.h,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       AppColors.primaryBlueLight,
//                       AppColors.primaryBlueDark,
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(18),
//                     bottomRight: Radius.circular(18),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 38.r,
//                       backgroundImage: const AssetImage('assets/images/profile.jpg'),
//                     ),
//                     SizedBox(height: 10.h),
//                     Text(
//                       vm.userName,
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       vm.phoneNumber,
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Current Plan Section
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: AppColors.cardBackground,
//                     borderRadius: BorderRadius.circular(10.r),
//                     border: Border.all(color: AppColors.borderGrey),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(10.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(Icons.workspace_premium, color: Colors.amber),
//                             SizedBox(width: 6.w),
//                             Text(
//                               "Current Plan",
//                               style: TextStyle(
//                                 color: AppColors.textColorDark,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                             const Spacer(),
//                             Container(
//                               padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
//                               decoration: BoxDecoration(
//                                 color: Colors.green.withOpacity(0.15),
//                                 borderRadius: BorderRadius.circular(8.r),
//                               ),
//                               child: Text(
//                                 vm.isActivePlan ? "Active" : "Inactive",
//                                 style: TextStyle(
//                                   color: Colors.green,
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 6.h),
//                         Text(
//                           vm.planName,
//                           style: TextStyle(
//                             color: AppColors.textColorDark,
//                             fontSize: 14.sp,
//                           ),
//                         ),
//                         SizedBox(height: 8.h),
//                         OutlinedButton(
//                           onPressed: () {},
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(color: AppColors.primaryBlue),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6.r),
//                             ),
//                           ),
//                           child: const Text(
//                             "Upgrade Plan",
//                             style: TextStyle(color: AppColors.primaryBlue),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // Profile Info Section
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
//                 child: Column(
//                   children: [
//                     _buildInfoCard(Icons.person, "Name", vm.userName),
//                     _buildInfoCard(Icons.location_on, "Location", vm.location),
//                     _buildInfoCard(Icons.phone, "Phone number", vm.phoneNumber),
//                   ],
//                 ),
//               ),

//               // Settings Section
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _sectionTitle("Settings"),
//                     _buildSettingTile(Icons.notifications, "Notifications", () {}),
//                     _buildLanguageTile(vm, context),
//                     _buildSettingTile(Icons.lock, "Change Password", () {}),
//                   ],
//                 ),
//               ),

//               // Other Settings
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _sectionTitle("Settings"),
//                     _buildSettingTile(Icons.history, "Prediction History", () {}),
//                     _buildSettingTile(Icons.help_outline, "Help & Support", () {}),
//                     _buildSettingTile(Icons.article, "Terms & Conditions", () {}),
//                     _buildSettingTile(Icons.privacy_tip, "Privacy & Policy", () {}),
//                   ],
//                 ),
//               ),

//               // Logout Button
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 14.h),
//                 child: ElevatedButton.icon(
//                   onPressed: () => vm.logout(context),
//                   icon: const Icon(Icons.logout, color: Colors.red),
//                   label: Text(
//                     "Logout",
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 15.sp,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.white,
//                     fixedSize: Size(180.w, 45.h),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     elevation: 0,
//                     side: const BorderSide(color: Colors.redAccent),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) => Padding(
//         padding: EdgeInsets.symmetric(vertical: 8.h),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: AppColors.textColorDark,
//             fontWeight: FontWeight.bold,
//             fontSize: 14.sp,
//           ),
//         ),
//       );

//   Widget _buildInfoCard(IconData icon, String title, String value) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5.h),
//       padding: EdgeInsets.all(12.w),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         border: Border.all(color: AppColors.borderGrey),
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.primaryBlue, size: 20.w),
//           SizedBox(width: 10.w),
//           Expanded(
//             child: Text(
//               "$title\n$value",
//               style: TextStyle(
//                 color: AppColors.textColorDark,
//                 fontSize: 13.sp,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon, color: AppColors.primaryBlue, size: 22.w),
//       title: Text(title, style: TextStyle(fontSize: 14.sp)),
//       onTap: onTap,
//     );
//   }

//   Widget _buildLanguageTile(ProfileViewModel vm, BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(Icons.language, color: AppColors.primaryBlue, size: 22.w),
//       title: const Text("Language"),
//       trailing: DropdownButton<String>(
//         value: vm.language,
//         underline: const SizedBox(),
//         items: const [
//           DropdownMenuItem(value: "English", child: Text("English")),
//         ],
//         onChanged: (value) {
//           if (value != null) vm.changeLanguage(value);
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';
// import 'package:ziya_lottery_app/Result/widgets/custom_app_bar.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<ProfileViewModel>(context);

//     return Scaffold(
//       backgroundColor: AppColors.backgroundGrey,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header + Profile info + Current Plan (fixed)
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 // Gradient Header
//                 GradientHeader(
//                   child: SafeArea(
//                     bottom: false,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.arrow_back, color: AppColors.white, size: 22.w),
//                                 onPressed: () => Navigator.pop(context),
//                               ),
//                               SizedBox(width: 6.w),
//                               Text(
//                                 "Profile",
//                                 style: TextStyle(
//                                   color: AppColors.white,
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 10.h),
//                         CircleAvatar(
//                           radius: 38.r,
//                           backgroundImage: NetworkImage(vm.profileImageUrl),
//                         ),
//                         SizedBox(height: 10.h),
//                         Text(
//                           vm.userName,
//                           style: TextStyle(
//                             color: AppColors.white,
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Text(
//                           vm.phoneNumber,
//                           style: TextStyle(color: AppColors.white, fontSize: 14.sp),
//                         ),
//                         SizedBox(height: 60.h), // space for overlapping card
//                       ],
//                     ),
//                   ),
//                 ),

//                 // Current Plan card overlapping header bottom
//                 Positioned(
//                   left: 16.w,
//                   right: 16.w,
//                   bottom: -60.h,
//                   child: Container(
//                     height: 120.h,
//                     decoration: BoxDecoration(
//                       color: AppColors.cardBackground,
//                       borderRadius: BorderRadius.circular(10.r),
//                       border: Border.all(color: AppColors.borderGrey),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(12.w),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.workspace_premium, color: Colors.amber),
//                               SizedBox(width: 6.w),
//                               Text(
//                                 "Current Plan",
//                                 style: TextStyle(
//                                   color: AppColors.textColorDark,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 14.sp,
//                                 ),
//                               ),
//                               const Spacer(),
//                               Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green.withOpacity(0.15),
//                                   borderRadius: BorderRadius.circular(8.r),
//                                 ),
//                                 child: Text(
//                                   vm.isActivePlan ? "Active" : "Inactive",
//                                   style: TextStyle(
//                                     color: Colors.green,
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 6.h),
//                           Text(vm.planName,
//                               style: TextStyle(
//                                   color: AppColors.textColorDark, fontSize: 14.sp)),
//                           SizedBox(height: 8.h),
//                           OutlinedButton(
//                             onPressed: () {},
//                             style: OutlinedButton.styleFrom(
//                               side: const BorderSide(color: AppColors.primaryBlue),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6.r),
//                               ),
//                             ),
//                             child: const Text(
//                               "Upgrade Plan",
//                               style: TextStyle(color: AppColors.primaryBlue),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // Scrollable content (everything below the Current Plan)
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 padding: EdgeInsets.only(top: 70.h), // spacing under fixed card
//                 child: Column(
//                   children: [
//                     // User Info
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//                       child: Column(
//                         children: [
//                           _buildInfoCard(Icons.person, "Name", vm.userName),
//                           _buildInfoCard(Icons.location_on, "Location", vm.location),
//                           _buildInfoCard(Icons.phone, "Phone number", vm.phoneNumber),
//                         ],
//                       ),
//                     ),

//                     // Settings
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sectionTitle("Settings"),
//                           _buildSettingTile(Icons.notifications, "Notifications", () {}),
//                           _buildLanguageTile(vm),
//                           _buildSettingTile(Icons.lock, "Change Password", () {}),
//                         ],
//                       ),
//                     ),

//                     // More
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _sectionTitle("Settings"),
//                           _buildSettingTile(Icons.history, "Prediction History", () {}),
//                           _buildSettingTile(Icons.help_outline, "Help & Support", () {}),
//                           _buildSettingTile(Icons.article, "Terms & Conditions", () {}),
//                           _buildSettingTile(Icons.privacy_tip, "Privacy & Policy", () {}),
//                         ],
//                       ),
//                     ),

//                     // Logout
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 14.h),
//                       child: ElevatedButton.icon(
//                         onPressed: () => vm.logout(context),
//                         icon: const Icon(Icons.logout, color: Colors.red),
//                         label: Text(
//                           "Logout",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 15.sp,
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.white,
//                           fixedSize: Size(180.w, 45.h),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.r),
//                           ),
//                           elevation: 0,
//                           side: const BorderSide(color: Colors.redAccent),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) => Padding(
//         padding: EdgeInsets.symmetric(vertical: 8.h),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: AppColors.textColorDark,
//             fontWeight: FontWeight.bold,
//             fontSize: 14.sp,
//           ),
//         ),
//       );

//   Widget _buildInfoCard(IconData icon, String title, String value) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5.h),
//       padding: EdgeInsets.all(12.w),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         border: Border.all(color: AppColors.borderGrey),
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.primaryBlue, size: 20.w),
//           SizedBox(width: 10.w),
//           Expanded(
//             child: Text(
//               "$title\n$value",
//               style: TextStyle(
//                 color: AppColors.textColorDark,
//                 fontSize: 13.sp,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon, color: AppColors.primaryBlue, size: 22.w),
//       title: Text(title, style: TextStyle(fontSize: 14.sp)),
//       onTap: onTap,
//     );
//   }

//   Widget _buildLanguageTile(ProfileViewModel vm) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(Icons.language, color: AppColors.primaryBlue, size: 22.w),
//       title: const Text("Language"),
//       trailing: DropdownButton<String>(
//         dropdownColor: Colors.white,
//         value: vm.language,
//         underline: const SizedBox(),
//         items: const [
//           DropdownMenuItem(value: "English", child: Text("English")),
//           DropdownMenuItem(value: "Malayalam", child: Text("Malayalam")),
//           DropdownMenuItem(value: "Hindi", child: Text("Hindi")),
//           DropdownMenuItem(value: "Tamil", child: Text("Tamil")),
//         ],
//         onChanged: (value) {
//           if (value != null) vm.changeLanguage(value);
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';
// import 'package:ziya_lottery_app/Result/widgets/custom_app_bar.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<ProfileViewModel>(context);

//     return Scaffold(
//       backgroundColor: AppColors.backgroundGrey,
//       body: Column(
//         children: [
//           // Custom GradientHeader (App Bar)
//           GradientHeader(
//             child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.arrow_back, color: AppColors.white, size: 22.w),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                         SizedBox(width: 6.w),
//                         Text(
//                           "Profile",
//                           style: TextStyle(
//                             color: AppColors.white,
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   CircleAvatar(
//                     radius: 38.r,
//                     backgroundImage: NetworkImage(vm.profileImageUrl),
//                   ),
//                   SizedBox(height: 10.h),
//                   Text(
//                     vm.userName,
//                     style: TextStyle(
//                       color: AppColors.white,
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Text(
//                     vm.phoneNumber,
//                     style: TextStyle(color: AppColors.white, fontSize: 14.sp),
//                   ),
//                   SizedBox(height: 15.h),

//                   // Current Plan card inside the same header area
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.w),
//                     child: Container(
//                       height: 120.h,
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(10.r),
//                         border: Border.all(color: AppColors.borderGrey),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 6,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(12.w),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 const Icon(Icons.workspace_premium, color: Colors.amber),
//                                 SizedBox(width: 6.w),
//                                 Text(
//                                   "Current Plan",
//                                   style: TextStyle(
//                                     color: AppColors.textColorDark,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 14.sp,
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
//                                   decoration: BoxDecoration(
//                                     color: vm.isActivePlan
//                                         ? Colors.green.withOpacity(0.15)
//                                         : Colors.red.withOpacity(0.15),
//                                     borderRadius: BorderRadius.circular(8.r),
//                                   ),
//                                   child: Text(
//                                     vm.isActivePlan ? "Active" : "Inactive",
//                                     style: TextStyle(
//                                       color: vm.isActivePlan ? Colors.green : Colors.red,
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 6.h),
//                             Text(
//                               vm.planName,
//                               style: TextStyle(
//                                 color: AppColors.textColorDark,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                             SizedBox(height: 8.h),
//                             OutlinedButton(
//                               onPressed: () {},
//                               style: OutlinedButton.styleFrom(
//                                 side: const BorderSide(color: AppColors.primaryBlue),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6.r),
//                                 ),
//                               ),
//                               child: Text(
//                                 "Upgrade Plan",
//                                 style: TextStyle(color: AppColors.primaryBlue, fontSize: 13.sp),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
            
//           ),

//           // Scrollable body (below app bar)
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               padding: EdgeInsets.only(top: 16.h),
//               child: Column(
//                 children: [
//                   _buildInfoSection(vm),
//                   _buildSettingsSection(vm),
//                   _buildMoreSection(vm),
//                   _buildLogoutButton(context, vm),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoSection(ProfileViewModel vm) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//       child: Column(
//         children: [
//           _buildInfoCard(Icons.person, "Name", vm.userName),
//           _buildInfoCard(Icons.location_on, "Location", vm.location),
//           _buildInfoCard(Icons.phone, "Phone number", vm.phoneNumber),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsSection(ProfileViewModel vm) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle("Settings"),
//           _buildSettingTile(Icons.notifications, "Notifications", () {}),
//           _buildLanguageTile(vm),
//           _buildSettingTile(Icons.lock, "Change Password", () {}),
//         ],
//       ),
//     );
//   }

//   Widget _buildMoreSection(ProfileViewModel vm) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle("More"),
//           _buildSettingTile(Icons.history, "Prediction History", () {}),
//           _buildSettingTile(Icons.help_outline, "Help & Support", () {}),
//           _buildSettingTile(Icons.article, "Terms & Conditions", () {}),
//           _buildSettingTile(Icons.privacy_tip, "Privacy & Policy", () {}),
//         ],
//       ),
//     );
//   }

//   Widget _buildLogoutButton(BuildContext context, ProfileViewModel vm) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 14.h),
//       child: ElevatedButton.icon(
//         onPressed: () => vm.logout(context),
//         icon: const Icon(Icons.logout, color: Colors.red),
//         label: Text(
//           "Logout",
//           style: TextStyle(
//             color: Colors.red,
//             fontWeight: FontWeight.w600,
//             fontSize: 15.sp,
//           ),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.white,
//           fixedSize: Size(180.w, 45.h),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.r),
//           ),
//           elevation: 0,
//           side: const BorderSide(color: Colors.redAccent),
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) => Padding(
//         padding: EdgeInsets.symmetric(vertical: 8.h),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: AppColors.textColorDark,
//             fontWeight: FontWeight.bold,
//             fontSize: 14.sp,
//           ),
//         ),
//       );

//   Widget _buildInfoCard(IconData icon, String title, String value) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5.h),
//       padding: EdgeInsets.all(12.w),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         border: Border.all(color: AppColors.borderGrey),
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.primaryBlue, size: 20.w),
//           SizedBox(width: 10.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: TextStyle(
//                         color: AppColors.textColorDark,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 13.sp)),
//                 Text(value,
//                     style: TextStyle(
//                         color: AppColors.textColorDark.withOpacity(0.8),
//                         fontSize: 12.sp)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon, color: AppColors.primaryBlue, size: 22.w),
//       title: Text(title, style: TextStyle(fontSize: 14.sp)),
//       onTap: onTap,
//     );
//   }

//   Widget _buildLanguageTile(ProfileViewModel vm) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(Icons.language, color: AppColors.primaryBlue, size: 22.w),
//       title: const Text("Language"),
//       trailing: DropdownButton<String>(
//         dropdownColor: Colors.white,
//         value: vm.language,
//         underline: const SizedBox(),
//         items: const [
//           DropdownMenuItem(value: "English", child: Text("English")),
//           DropdownMenuItem(value: "Malayalam", child: Text("Malayalam")),
//           DropdownMenuItem(value: "Hindi", child: Text("Hindi")),
//           DropdownMenuItem(value: "Tamil", child: Text("Tamil")),
//         ],
//         onChanged: (value) {
//           if (value != null) vm.changeLanguage(value);
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';
// import 'package:ziya_lottery_app/Result/widgets/custom_app_bar.dart';
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<ProfileViewModel>(context);

//     return Scaffold(
//       backgroundColor: AppColors.backgroundGrey,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// 🔷 Header + Floating Card (Stack)
//             Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.topCenter,
//               children: [
//                 /// ✅ Using GradientHeader instead of Container
//                 GradientHeader(
//                   child: SafeArea(
//                     bottom: false,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 icon: Icon(Icons.arrow_back,
//                                     color: Colors.white, size: 22.w),
//                                 onPressed: () => Navigator.pop(context),
//                               ),
//                               SizedBox(width: 6.w),
//                               Text(
//                                 "Profile",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 10.h),
//                         CircleAvatar(
//                           radius: 38.r,
//                           backgroundImage: NetworkImage(vm.profileImageUrl),
//                         ),
//                         SizedBox(height: 10.h),
//                         Text(
//                           vm.userName,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Text(
//                           vm.phoneNumber,
//                           style:
//                               TextStyle(color: Colors.white, fontSize: 14.sp),
//                         ),
//                         SizedBox(height: 70.h),
//                       ],
//                     ),
//                   ),
//                 ),

//                 /// Floating “Current Plan” card (same as before)
//                 Positioned(
//                   bottom: -60.h,
//                   left: 20.w,
//                   right: 20.w,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12.r),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 8,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(Icons.workspace_premium,
//                                 color: Colors.amber, size: 20),
//                             SizedBox(width: 6.w),
//                             Text(
//                               "Current Plan",
//                               style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                             const Spacer(),
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 8.w, vertical: 2.h),
//                               decoration: BoxDecoration(
//                                 color: vm.isActivePlan
//                                     ? Colors.green.withOpacity(0.1)
//                                     : Colors.red.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(8.r),
//                               ),
//                               child: Text(
//                                 vm.isActivePlan ? "Active" : "Inactive",
//                                 style: TextStyle(
//                                   color: vm.isActivePlan
//                                       ? Colors.green
//                                       : Colors.red,
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 6.h),
//                         Text(
//                           vm.planName,
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         SizedBox(height: 10.h),
//                         OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                             minimumSize: Size(double.infinity, 34.h),
//                             side:
//                                 BorderSide(color: Colors.blue.shade600, width: 1),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8.r),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             "Upgrade Plan",
//                             style: TextStyle(
//                               color: Colors.blue.shade700,
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             SizedBox(height: 90.h),

//             /// 🔹 Info, Settings, and More Sections (unchanged)
//             _buildInfoSection(vm),
//             _buildSettingsSection(vm),
//             _buildMoreSection(vm),
//             _buildLogoutButton(context, vm),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- UI SECTIONS BELOW ---

//   Widget _buildInfoSection(ProfileViewModel vm) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//       child: Column(
//         children: [
//           _buildInfoCard(Icons.person, "Name", vm.userName),
//           _buildInfoCard(Icons.location_on, "Location", vm.location),
//           _buildInfoCard(Icons.phone, "Phone number", vm.phoneNumber),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoCard(IconData icon, String title, String value) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5.h),
//       padding: EdgeInsets.all(12.w),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         border: Border.all(color: AppColors.borderGrey),
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.primaryBlue, size: 20.w),
//           SizedBox(width: 10.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: TextStyle(
//                         color: AppColors.textColorDark,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 13.sp)),
//                 Text(value,
//                     style: TextStyle(
//                         color: AppColors.textColorDark.withOpacity(0.8),
//                         fontSize: 12.sp)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsSection(ProfileViewModel vm) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle("Settings"),
//           _buildSettingTile(Icons.notifications, "Notifications", () {}),
//           _buildLanguageTile(vm),
//           _buildSettingTile(Icons.lock, "Change Password", () {}),
//         ],
//       ),
//     );
//   }

//   Widget _buildMoreSection(ProfileViewModel vm) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionTitle("More"),
//           _buildSettingTile(Icons.history, "Prediction History", () {}),
//           _buildSettingTile(Icons.help_outline, "Help & Support", () {}),
//           _buildSettingTile(Icons.article, "Terms & Conditions", () {}),
//           _buildSettingTile(Icons.privacy_tip, "Privacy & Policy", () {}),
//         ],
//       ),
//     );
//   }

//   Widget _buildLogoutButton(BuildContext context, ProfileViewModel vm) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 14.h),
//       child: ElevatedButton.icon(
//         onPressed: () => vm.logout(context),
//         icon: const Icon(Icons.logout, color: Colors.red),
//         label: Text(
//           "Logout",
//           style: TextStyle(
//             color: Colors.red,
//             fontWeight: FontWeight.w600,
//             fontSize: 15.sp,
//           ),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.white,
//           fixedSize: Size(180.w, 45.h),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.r),
//           ),
//           elevation: 0,
//           side: const BorderSide(color: Colors.redAccent),
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String title) => Padding(
//         padding: EdgeInsets.symmetric(vertical: 8.h),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: AppColors.textColorDark,
//             fontWeight: FontWeight.bold,
//             fontSize: 14.sp,
//           ),
//         ),
//       );

//  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
//   return InkWell(
//     onTap: onTap,
//     borderRadius: BorderRadius.circular(10.r),
//     child: Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.h),
//       child: Row(
//         children: [
//           Icon(icon, color: AppColors.primaryBlue, size: 22.w),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: AppColors.textColorDark,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           const Icon(Icons.chevron_right, color: Colors.grey),
//         ],
//       ),
//     ),
//   );
// }

//   Widget _buildLanguageTile(ProfileViewModel vm) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(Icons.language, color: AppColors.primaryBlue, size: 22.w),
//       title: const Text("Language"),
//       trailing: DropdownButton<String>(
//         dropdownColor: Colors.white,
//         value: vm.language,
//         underline: const SizedBox(),
//         items: const [
//           DropdownMenuItem(value: "English", child: Text("English")),
//           DropdownMenuItem(value: "Malayalam", child: Text("മലയാളം")),
//           DropdownMenuItem(value: "Hindi", child: Text("हिंदी")),
//           DropdownMenuItem(value: "Tamil", child: Text("தமிழ்")),
//         ],
//         onChanged: (value) {
//           if (value != null) vm.changeLanguage(value);
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';
import 'package:ziya_lottery_app/Result/widgets/custom_app_bar.dart';

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
              /// Scrollable content under header
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

              /// Fixed Header + Floating Card
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
                                  horizontal: 12.w, vertical: 10.h),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_back,
                                        color: Colors.white, size: 22.w),
                                    onPressed: () => Navigator.pop(context),
                                  ),
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

                    /// Floating plan card
                    Positioned(
                      bottom: -60.h,
                      left: 20.w,
                      right: 20.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
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
                                const Icon(Icons.workspace_premium,
                                    color: Colors.amber, size: 20),
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
                                      horizontal: 8.w, vertical: 2.h),
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
                                    color: Colors.blue.shade600, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {},
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
                Text(title,
                    style: TextStyle(
                        color: AppColors.textColorDark,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp)),
                Text(value,
                    style: TextStyle(
                        color: AppColors.textColorDark.withOpacity(0.8),
                        fontSize: 12.sp)),
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
