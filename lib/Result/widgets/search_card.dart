

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

// class SearchCard extends StatefulWidget {
//   const SearchCard({super.key});

//   @override
//   State<SearchCard> createState() => _SearchCardState();
// }

// class _SearchCardState extends State<SearchCard> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _showDropdown = false;
  
//   // Available lottery names
//   final List<String> _lotteryNames = [
//     'Karunya',
//     'Bhagyadevatha',
//     'Akshaya',
//     'Win Win',
//     'Sthree Sakthi',
//     'Nirmal',
//     'Fifty Fifty',
//   ];

//   List<String> _filteredLotteries = [];

//   @override
//   void initState() {
//     super.initState();
//     _filteredLotteries = _lotteryNames;
//   }

//   void _filterLotteries(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         _filteredLotteries = _lotteryNames;
//       } else {
//         _filteredLotteries = _lotteryNames
//             .where((lottery) => 
//                 lottery.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LotteryViewModel>(context, listen: true);

//     return Container(
//       margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 20.h, bottom: 8.h),
//       padding: EdgeInsets.all(0),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//       ),
//       child: Column(
//         children: [
//           // Enter Number Field with Blue Icon
//           _buildSearchField(context, provider),
          
//           SizedBox(height: 10.h),
          
//           // Select Date Field with Blue Icon
//           _buildDateField(context, provider),
          
//           SizedBox(height: 19.h),
          
//           // CHECK Button
//           Container(
//             width: double.infinity,
//             height: 40.h,
//             margin: EdgeInsets.symmetric(horizontal: 0),
//             child: ElevatedButton(
//               onPressed: () {
//                 provider.showResults();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 elevation: 0,
//               ),
//               child: Text(
//                 'CHECK',
//                 style: TextStyle(
//                   color: AppColors.primaryBlueDark,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 1,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildSearchField(BuildContext context, LotteryViewModel provider) {
//   return StatefulBuilder(
//     builder: (context, setState) {
//       return Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // Search field card
//           Container(
//             height: 37.h,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.r),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 8.r,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 48.w,
//                   height: 48.h,
//                   decoration: BoxDecoration(
//                     color: const Color.fromRGBO(25, 118, 210, 1),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10.r),
//                       bottomLeft: Radius.circular(10.r),
//                     ),
//                   ),
//                   alignment: Alignment.center,
//                   child: Icon(Icons.search, color: Colors.white, size: 22.w),
//                 ),
//                 SizedBox(width: 16.w),
//                 Expanded(
//                   child: TextField(
//                     controller: _searchController,
//                     onChanged: (value) {
//                       _filterLotteries(value);
//                       provider.updateSearchNumber(value);
//                       setState(() => _showDropdown = value.isNotEmpty);
//                     },
//                     onTap: () => setState(() => _showDropdown = !_showDropdown),
//                     style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//                     decoration: InputDecoration(
//                       hintText: 'Enter Number',
//                       hintStyle: TextStyle(
//                         fontSize: 14.sp,
//                         color: Colors.grey[400],
//                         fontWeight: FontWeight.w400,
//                       ),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.zero,
//                       isDense: true,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() => _showDropdown = !_showDropdown);
//                     FocusScope.of(context).unfocus();
//                   },
//                   child: Container(
//                     width: 48.w,
//                     alignment: Alignment.center,
//                     child: Icon(
//                       _showDropdown
//                           ? Icons.keyboard_arrow_up
//                           : Icons.keyboard_arrow_down,
//                       color: Colors.grey[400],
//                       size: 24.w,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Floating dropdown (overlay)
//           if (_showDropdown)
//             Positioned(
//               top: 42.h, // distance below search field
//               left: 0,
//               right: 0,
//               child: Material(
//                 color: Colors.transparent,
//                 child: Container(
//                   constraints: BoxConstraints(maxHeight: 200.h),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 8.r,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     padding: EdgeInsets.zero,
//                     itemCount: _filteredLotteries.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           _searchController.text = _filteredLotteries[index];
//                           provider
//                               .updateSearchNumber(_filteredLotteries[index]);
//                           setState(() => _showDropdown = false);
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 16.w,
//                             vertical: 12.h,
//                           ),
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                 color: Colors.grey[200]!,
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.confirmation_number_outlined,
//                                 color: AppColors.primaryBlueDark,
//                                 size: 20.w,
//                               ),
//                               SizedBox(width: 12.w),
//                               Text(
//                                 _filteredLotteries[index],
//                                 style: TextStyle(
//                                   fontSize: 15.sp,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       );
//     },
//   );
// }


//   // Widget _buildSearchField(BuildContext context, LotteryViewModel provider) {
//   //   return Column(
//   //     children: [
//   //       Container(
//   //         height: 37.h,
//   //         decoration: BoxDecoration(
//   //           color: Colors.white,
//   //           borderRadius: BorderRadius.circular(10.r),
//   //         ),
//   //         child: Row(
//   //           children: [
//   //             // Blue Icon Section (Left)
//   //             Container(
//   //               width: 48.w,
//   //               height: 48.h,
//   //               decoration: BoxDecoration(
//   //                 color: Color.fromRGBO(25, 118, 210, 1),
//   //                 borderRadius: BorderRadius.only(
//   //                   topLeft: Radius.circular(10.r),
//   //                   bottomLeft: Radius.circular(10.r),
//   //                   // topRight: Radius.circular(8.r),
//   //                   // bottomRight: Radius.circular(8.r),
//   //                 ),
//   //               ),
//   //               alignment: Alignment.center,
//   //               child: Icon(
//   //                 Icons.search,
//   //                 color: Colors.white,
//   //                 size: 22.w,
//   //               ),
//   //             ),
              
//   //             SizedBox(width: 16.w),
              
//   //             // Text Field
//   //             Expanded(
//   //               child: TextField(
//   //                 controller: _searchController,
//   //                 onChanged: (value) {
//   //                   _filterLotteries(value);
//   //                   provider.updateSearchNumber(value);
//   //                   if (value.isNotEmpty) {
//   //                     setState(() => _showDropdown = true);
//   //                   }
//   //                 },
//   //                 onTap: () {
//   //                   setState(() => _showDropdown = !_showDropdown);
//   //                 },
//   //                 style: TextStyle(
//   //                   fontSize: 14.sp,
//   //                   color: Colors.black87,
//   //                 ),
//   //                 decoration: InputDecoration(
//   //                   hintText: 'Enter Number',
//   //                   hintStyle: TextStyle(
//   //                     fontSize: 14.sp,
//   //                     color: Colors.grey[400],
//   //                     fontWeight: FontWeight.w400,
//   //                   ),
//   //                   border: InputBorder.none,
//   //                   contentPadding: EdgeInsets.zero,
//   //                   isDense: true,
//   //                 ),
//   //               ),
//   //             ),
              
//   //             // Dropdown Arrow
//   //             GestureDetector(
//   //               onTap: () {
//   //                 setState(() => _showDropdown = !_showDropdown);
//   //                 FocusScope.of(context).unfocus();
//   //               },
//   //               child: Container(
//   //                 width: 48.w,
//   //                 alignment: Alignment.center,
//   //                 child: Icon(
//   //                   _showDropdown 
//   //                       ? Icons.keyboard_arrow_up 
//   //                       : Icons.keyboard_arrow_down,
//   //                   color: Colors.grey[400],
//   //                   size: 24.w,
//   //                 ),
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
        
//   //       // Dropdown List
//   //       if (_showDropdown)
//   //         Container(
//   //           margin: EdgeInsets.only(top: 4.h),
//   //           constraints: BoxConstraints(maxHeight: 200.h),
//   //           decoration: BoxDecoration(
//   //             color: Colors.white,
//   //             borderRadius: BorderRadius.circular(12.r),
//   //             boxShadow: [
//   //               BoxShadow(  
//   //                 color: Colors.black.withOpacity(0.1),
//   //                 blurRadius: 8.r,
//   //                 offset: const Offset(0, 2),
//   //               ),
//   //             ],
//   //           ),
//   //           child: ListView.builder(
//   //             shrinkWrap: true,
//   //             padding: EdgeInsets.zero,
//   //             itemCount: _filteredLotteries.length,
//   //             itemBuilder: (context, index) {
//   //               return InkWell(
//   //                 onTap: () {
//   //                   _searchController.text = _filteredLotteries[index];
//   //                   provider.updateSearchNumber(_filteredLotteries[index]);
//   //                   setState(() => _showDropdown = false);
//   //                 },
//   //                 child: Container(
//   //                   padding: EdgeInsets.symmetric(
//   //                     horizontal: 16.w,
//   //                     vertical: 12.h,
//   //                   ),
//   //                   decoration: BoxDecoration(
//   //                     border: Border(
//   //                       bottom: BorderSide(
//   //                         color: Colors.grey[200]!,
//   //                         width: 1,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   child: Row(
//   //                     children: [
//   //                       Icon(
//   //                         Icons.confirmation_number_outlined,
//   //                         color: AppColors.primaryBlueDark,
//   //                         size: 20.w,
//   //                       ),
//   //                       SizedBox(width: 12.w),
//   //                       Text(
//   //                         _filteredLotteries[index],
//   //                         style: TextStyle(
//   //                           fontSize: 15.sp,
//   //                           color: Colors.black87,
//   //                         ),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),
//   //               );
//   //             },
//   //           ),
//   //         ),
//   //     ],
//   //   );
//   // }

//   Widget _buildDateField(BuildContext context, LotteryViewModel provider) {
//     final String dateDisplay = provider.selectedDate == null
//         ? 'Select Date'
//         : DateFormat('dd/MM/yyyy').format(provider.selectedDate!);

//     return GestureDetector(
//       onTap: () async {
//         setState(() => _showDropdown = false);
        
//         DateTime? picked = await showDatePicker(
//           context: context,
//           initialDate: provider.selectedDate ?? DateTime.now(),
//           firstDate: DateTime(2000),
//           lastDate: DateTime(2101),
//           builder: (context, child) {
//             return Theme(
//               data: ThemeData.light().copyWith(
//                 colorScheme: ColorScheme.light(
//                   primary: AppColors.primaryBlueDark,
//                   onPrimary: Colors.white,
//                   onSurface: Colors.black87,
//                 ),
//                 textButtonTheme: TextButtonThemeData(
//                   style: TextButton.styleFrom(
//                     foregroundColor: AppColors.primaryBlueDark,
//                   ),
//                 ),
//               ),
//               child: child!,
//             );
//           },
//         );
//         if (picked != null) {
//           provider.updateSearchDate(picked);
//         }
//       },
//       child: Container(
//         height: 37.h,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.r),
//         ),
//         child: Row(
//           children: [
//             // Blue Calendar Icon Section (Left)
//             Container(
//               width: 48.w,
//               height: 48.h,
//               decoration: BoxDecoration(
//                   color: Color.fromRGBO(25, 118, 210, 1),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10.r),
//                   bottomLeft: Radius.circular(10.r),
//                   // topRight: Radius.circular(8.r),
//                   // bottomRight: Radius.circular(8.r),
//                 ),
//               ),
//               alignment: Alignment.center,
//               child: Icon(
//                 Icons.calendar_today_outlined,
//                 color: Colors.white,
//                 size: 20.w,
//               ),
//             ),
            
//             SizedBox(width: 16.w),
            
//             // Date Text
//             Expanded(
//               child: Text(
//                 dateDisplay,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   color: provider.selectedDate == null
//                       ? Colors.grey[400]
//                       : Colors.black87,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }
// ----------------------------------------------------




// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';

// class SearchCard extends StatefulWidget {
//   const SearchCard({super.key});

//   @override
//   State<SearchCard> createState() => _SearchCardState();
// }

// class _SearchCardState extends State<SearchCard> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _showDropdown = false;
//   List<String> _filteredLotteries = [];
//   final List<String> _lotteryNames = [
//     'Karunya',
//     'Bhagyadevatha',
//     'Akshaya',
//     'Win Win',
//     'Sthree Sakthi',
//     'Nirmal',
//     'Fifty Fifty',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _filteredLotteries = _lotteryNames;
//   }

//   void _filterLotteries(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         _filteredLotteries = _lotteryNames;
//       } else {
//         _filteredLotteries = _lotteryNames
//             .where((lottery) =>
//                 lottery.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LotteryViewModel>(context);

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       child: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Column(
//                 children: [
//                   _buildSearchField(context, provider),
//                   SizedBox(height: 12.h),
//                   _buildDateField(context, provider),
//                   SizedBox(height: 18.h),
//                   _buildCheckButton(provider),
//                 ],
//               ),

//               /// Dropdown with scroll and limited height
//               if (_showDropdown)
//                 Positioned(
//                   top: 46.h,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     constraints: BoxConstraints(
//                       maxHeight: 180.h, // roughly 3–4 items
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12.r),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 10.r,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Scrollbar(
//                       radius: Radius.circular(10.r),
//                       thickness: 3,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         padding: EdgeInsets.zero,
//                         itemCount: _filteredLotteries.length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               _searchController.text =
//                                   _filteredLotteries[index];
//                               provider.updateSearchNumber(
//                                   _filteredLotteries[index]);
//                               setState(() => _showDropdown = false);
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 16.w,
//                                 vertical: 12.h,
//                               ),
//                               decoration: BoxDecoration(
//                                 border: Border(
//                                   bottom: BorderSide(
//                                     color: Colors.grey[200]!,
//                                     width: 1,
//                                   ),
//                                 ),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.confirmation_number_outlined,
//                                       color: AppColors.primaryBlueDark,
//                                       size: 20.w),
//                                   SizedBox(width: 12.w),
//                                   Text(
//                                     _filteredLotteries[index],
//                                     style: TextStyle(
//                                       fontSize: 15.sp,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchField(BuildContext context, LotteryViewModel provider) {
//     return Material(
//       elevation: 2,
//       borderRadius: BorderRadius.circular(10.r),
//       child: Container(
//         height: 37.h,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.r),
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 48.w,
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 color: const Color.fromRGBO(25, 118, 210, 1),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10.r),
//                   bottomLeft: Radius.circular(10.r),
//                 ),
//               ),
//               alignment: Alignment.center,
//               child: Icon(Icons.search, color: Colors.white, size: 22.w),
//             ),
//             SizedBox(width: 16.w),
//             Expanded(
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: (value) {
//                   _filterLotteries(value);
//                   provider.updateSearchNumber(value);
//                   setState(() => _showDropdown = value.isNotEmpty);
//                 },
//                 onTap: () {
//                   setState(() => _showDropdown = !_showDropdown);
//                 },
//                 style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//                 decoration: InputDecoration(
//                   hintText: 'Enter Number',
//                   hintStyle: TextStyle(
//                     fontSize: 14.sp,
//                     color: Colors.grey[400],
//                     fontWeight: FontWeight.w400,
//                   ),
//                   border: InputBorder.none,
//                   isDense: true,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() => _showDropdown = !_showDropdown);
//                 FocusScope.of(context).unfocus();
//               },
//               child: Container(
//                 width: 48.w,
//                 alignment: Alignment.center,
//                 child: Icon(
//                   _showDropdown
//                       ? Icons.keyboard_arrow_up
//                       : Icons.keyboard_arrow_down,
//                   color: Colors.grey[400],
//                   size: 24.w,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDateField(BuildContext context, LotteryViewModel provider) {
//     final String dateDisplay = provider.selectedDate == null
//         ? 'Select Date'
//         : DateFormat('dd/MM/yyyy').format(provider.selectedDate!);

//     return Material(
//       elevation: 2,
//       borderRadius: BorderRadius.circular(10.r),
//       child: GestureDetector(
//         onTap: () async {
//           setState(() => _showDropdown = false);
//           DateTime? picked = await showDatePicker(
//             context: context,
//             initialDate: provider.selectedDate ?? DateTime.now(),
//             firstDate: DateTime(2000),
//             lastDate: DateTime(2101),
//             builder: (context, child) => Theme(
//               data: ThemeData.light().copyWith(
//                 colorScheme: ColorScheme.light(
//                   primary: AppColors.primaryBlueDark,
//                   onPrimary: Colors.white,
//                   onSurface: Colors.black87,
//                 ),
//               ),
//               child: child!,
//             ),
//           );
//           if (picked != null) provider.updateSearchDate(picked);
//         },
//         child: Container(
//           height: 37.h,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 48.w,
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   color: const Color.fromRGBO(25, 118, 210, 1),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10.r),
//                     bottomLeft: Radius.circular(10.r),
//                   ),
//                 ),
//                 alignment: Alignment.center,
//                 child: Icon(Icons.calendar_today_outlined,
//                     color: Colors.white, size: 20.w),
//               ),
//               SizedBox(width: 16.w),
//               Expanded(
//                 child: Text(
//                   dateDisplay,
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     color: provider.selectedDate == null
//                         ? Colors.grey[400]
//                         : Colors.black87,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCheckButton(LotteryViewModel provider) {
//     return Material(
//       elevation: 3,
//       borderRadius: BorderRadius.circular(10.r),
//       child: SizedBox(
//         width: double.infinity,
//         height: 40.h,
//         child: ElevatedButton(
//           onPressed: () {
//             FocusScope.of(context).unfocus();
//             provider.showResults();
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//           ),
//           child: Text(
//             'CHECK',
//             style: TextStyle(
//               color: AppColors.primaryBlueDark,
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
 // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';

// class SearchCard extends StatefulWidget {
//   const SearchCard({super.key});

//   @override
//   State<SearchCard> createState() => _SearchCardState();
// }

// class _SearchCardState extends State<SearchCard> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _showDropdown = false;
//   List<String> _filteredLotteries = [];
//   final List<String> _lotteryNames = [
//     'Karunya',
//     'Bhagyadevatha',
//     'Akshaya',
//     'Win Win',
//     'Sthree Sakthi',
//     'Nirmal',
//     'Fifty Fifty',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _filteredLotteries = _lotteryNames;
//   }

//   void _filterLotteries(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         _filteredLotteries = _lotteryNames;
//       } else {
//         _filteredLotteries = _lotteryNames
//             .where((lottery) =>
//                 lottery.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   bool _canShowResults(LotteryViewModel provider) {
//     return _searchController.text.isNotEmpty && provider.selectedDate != null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LotteryViewModel>(context);

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       child: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Column(
//                 children: [
//                   _buildSearchField(context, provider),
//                   SizedBox(height: 12.h),
//                   _buildDateField(context, provider),
//                   SizedBox(height: 18.h),
//                   _buildCheckButton(provider),
//                 ],
//               ),

//               /// Dropdown
//               if (_showDropdown)
//                 Positioned(
//                   top: 46.h,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     constraints: BoxConstraints(maxHeight: 180.h),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12.r),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 10.r,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Scrollbar(
//                       radius: Radius.circular(10.r),
//                       thickness: 3,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         padding: EdgeInsets.zero,
//                         itemCount: _filteredLotteries.length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               _searchController.text =
//                                   _filteredLotteries[index];
//                               provider.updateSearchNumber(
//                                   _filteredLotteries[index]);
//                               setState(() => _showDropdown = false);
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 16.w,
//                                 vertical: 12.h,
//                               ),
//                               decoration: BoxDecoration(
//                                 border: Border(
//                                   bottom: BorderSide(
//                                     color: Colors.grey[200]!,
//                                     width: 1,
//                                   ),
//                                 ),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.confirmation_number_outlined,
//                                     color: AppColors.primaryBlueDark,
//                                     size: 20.w,
//                                   ),
//                                   SizedBox(width: 12.w),
//                                   Text(
//                                     _filteredLotteries[index],
//                                     style: TextStyle(
//                                       fontSize: 15.sp,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchField(BuildContext context, LotteryViewModel provider) {
//     return Material(
//       elevation: 2,
//       borderRadius: BorderRadius.circular(10.r),
//       child: Container(
//         height: 37.h,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.r),
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 48.w,
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 color: const Color.fromRGBO(25, 118, 210, 1),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10.r),
//                   bottomLeft: Radius.circular(10.r),
//                 ),
//               ),
//               alignment: Alignment.center,
//               child: Icon(Icons.search, color: Colors.white, size: 22.w),
//             ),
//             SizedBox(width: 16.w),
//             Expanded(
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: (value) {
//                   _filterLotteries(value);
//                   provider.updateSearchNumber(value);
//                   setState(() => _showDropdown = value.isNotEmpty);
//                 },
//                 onTap: () {
//                   setState(() => _showDropdown = !_showDropdown);
//                 },
//                 style: TextStyle(fontSize: 14.sp, color: Colors.black87),
//                 decoration: InputDecoration(
//                   hintText: 'Enter Lottery Name',
//                   hintStyle: TextStyle(
//                     fontSize: 14.sp,
//                     color: Colors.grey[400],
//                     fontWeight: FontWeight.w400,
//                   ),
//                   border: InputBorder.none,
//                   isDense: true,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() => _showDropdown = !_showDropdown);
//                 FocusScope.of(context).unfocus();
//               },
//               child: Container(
//                 width: 48.w,
//                 alignment: Alignment.center,
//                 child: Icon(
//                   _showDropdown
//                       ? Icons.keyboard_arrow_up
//                       : Icons.keyboard_arrow_down,
//                   color: Colors.grey[400],
//                   size: 24.w,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDateField(BuildContext context, LotteryViewModel provider) {
//     final String dateDisplay = provider.selectedDate == null
//         ? 'Select Date'
//         : DateFormat('dd/MM/yyyy').format(provider.selectedDate!);

//     return Material(
//       elevation: 2,
//       borderRadius: BorderRadius.circular(10.r),
//       child: GestureDetector(
//         onTap: () async {
//           setState(() => _showDropdown = false);
//           DateTime? picked = await showDatePicker(
//             context: context,
//             initialDate: provider.selectedDate ?? DateTime.now(),
//             firstDate: DateTime(2000),
//             lastDate: DateTime(2101),
//             builder: (context, child) => Theme(
//               data: ThemeData.light().copyWith(
//                 colorScheme: ColorScheme.light(
//                   primary: AppColors.primaryBlueDark,
//                   onPrimary: Colors.white,
//                   onSurface: Colors.black87,
//                 ),
//               ),
//               child: child!,
//             ),
//           );
//           if (picked != null) provider.updateSearchDate(picked);
//         },
//         child: Container(
//           height: 37.h,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 48.w,
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   color: const Color.fromRGBO(25, 118, 210, 1),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10.r),
//                     bottomLeft: Radius.circular(10.r),
//                   ),
//                 ),
//                 alignment: Alignment.center,
//                 child: Icon(Icons.calendar_today_outlined,
//                     color: Colors.white, size: 20.w),
//               ),
//               SizedBox(width: 16.w),
//               Expanded(
//                 child: Text(
//                   dateDisplay,
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     color: provider.selectedDate == null
//                         ? Colors.grey[400]
//                         : Colors.black87,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCheckButton(LotteryViewModel provider) {
//     final bool canShow = _canShowResults(provider);

//     return Material(
//       elevation: 3,
//       borderRadius: BorderRadius.circular(10.r),
//       child: SizedBox(
//         width: double.infinity,
//         height: 40.h,
//         child: ElevatedButton(
//           onPressed: canShow
//               ? () {
//                   FocusScope.of(context).unfocus();
//                   provider.showResults();
//                 }
//               : null, // disabled until both name + date are filled
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             disabledBackgroundColor: Colors.grey[200],
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//           ),
//           child: Text(
//             'CHECK',
//             style: TextStyle(
//               color: canShow
//                   ? AppColors.primaryBlueDark
//                   : Colors.grey[500],
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final TextEditingController _searchController = TextEditingController();
  bool _showDropdown = false;
  List<String> _filteredLotteries = [];
  final List<String> _lotteryNames = [
    'Karunya',
    'Bhagyadevatha',
    'Akshaya',
    'Win Win',
    'Sthree Sakthi',
    'Nirmal',
    'Fifty Fifty',
  ];

  @override
  void initState() {
    super.initState();
    _filteredLotteries = _lotteryNames;
  }

  void _filterLotteries(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredLotteries = _lotteryNames;
      } else {
        _filteredLotteries = _lotteryNames
            .where((lottery) =>
                lottery.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showSmoothSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: AppColors.primaryBlueDark.withOpacity(0.95),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: const Duration(seconds: 2),
        elevation: 4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryViewModel>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Use Stack + OverlayEntry for dropdown stability
          _buildSearchField(context, provider),
          if (_showDropdown) _buildDropdownOverlay(provider),
          SizedBox(height: 12.h),
          _buildDateField(context, provider),
          SizedBox(height: 18.h),
          _buildCheckButton(provider),
        ],
      ),
    );
  }

  Widget _buildDropdownOverlay(LotteryViewModel provider) {
    // Proper scrollable dropdown with no clipping
    return Container(
      margin: EdgeInsets.only(top: 4.h),
      constraints: BoxConstraints(
        maxHeight: 180.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Scrollbar(
        radius: Radius.circular(10.r),
        thickness: 3,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: _filteredLotteries.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                _searchController.text = _filteredLotteries[index];
                provider.updateSearchNumber(_filteredLotteries[index]);
                setState(() => _showDropdown = false);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.confirmation_number_outlined,
                      color: AppColors.primaryBlueDark,
                      size: 20.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        _filteredLotteries[index],
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, LotteryViewModel provider) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 37.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(25, 118, 210, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.search, color: Colors.white, size: 22.w),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  _filterLotteries(value);
                  provider.updateSearchNumber(value);
                  setState(() => _showDropdown = value.isNotEmpty);
                },
                onTap: () {
                  setState(() => _showDropdown = !_showDropdown);
                },
                style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                decoration: InputDecoration(
                  hintText: 'Enter Lottery Name',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => _showDropdown = !_showDropdown);
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: 48.w,
                alignment: Alignment.center,
                child: Icon(
                  _showDropdown
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey[400],
                  size: 24.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, LotteryViewModel provider) {
    final String dateDisplay = provider.selectedDate == null
        ? 'Select Date'
        : DateFormat('dd/MM/yyyy').format(provider.selectedDate!);

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10.r),
      child: GestureDetector(
        onTap: () async {
          setState(() => _showDropdown = false);
          DateTime now = DateTime.now();
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: provider.selectedDate ?? now,
            firstDate: DateTime(2000),
            lastDate: DateTime(now.year, now.month, now.day), // Disable future
            builder: (context, child) => Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primaryBlueDark,
                  onPrimary: Colors.white,
                  onSurface: Colors.black87,
                ),
              ),
              child: child!,
            ),
          );
          if (picked != null) provider.updateSearchDate(picked);
        },
        child: Container(
          height: 37.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(25, 118, 210, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.calendar_today_outlined,
                    color: Colors.white, size: 20.w),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  dateDisplay,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: provider.selectedDate == null
                        ? Colors.grey[400]
                        : Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckButton(LotteryViewModel provider) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        width: double.infinity,
        height: 40.h,
        child: ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            if (_searchController.text.isEmpty ||
                provider.selectedDate == null) {
              _showSmoothSnackBar(
                  context, 'Please select a valid lottery name and date');
            } else {
              provider.showResults();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text(
            'CHECK',
            style: TextStyle(
              color: AppColors.primaryBlueDark,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
