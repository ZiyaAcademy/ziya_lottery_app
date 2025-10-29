// import 'package:flutter/material.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/common_widgets/gradient_container.dart';

// class RecentWinnerCard extends StatelessWidget {
//   const RecentWinnerCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             GradientContainer(
//               height: 35,
//               width: 35,
//               child: Image.asset('assets/icons/trophy.png'),
//             ),

//             Column(
//               children: [
//                 Text("RECENT 1ST PRIZE WINNERS"),
//                 Text("Latest lottery winners"),
//               ],
//             ),
//           ],
//         ),
//         Container(
//           width: 330,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Color(0xFFEBF5FF), Color(0xFFDCEEFF)],
//             ),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Color(0xFFB3D9FF), width: 2),
//           ),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GradientContainer(
//                     height: 35,
//                     width: 35,
//                     child: Image.asset('assets/icons/trophy.png'),
//                   ),
//                   SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Anithya Suresh',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF111827),
//                           ),
//                         ),
//                         SizedBox(height: 2),
//                         Text(
//                           'Bhagyathara',
//                           style: TextStyle(
//                             fontSize: 11,
//                             color: Color(0xFF2563EB),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 6),

//               // Ticket and Location Info
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 padding: const EdgeInsets.all(12),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 16,
//                                 height: 16,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFFD1FAE5),
//                                   borderRadius: BorderRadius.circular(6),
//                                 ),
//                                 child: Center(
//                                   child: Icon(
//                                     Icons.confirmation_number_outlined,
//                                     color: Colors.green,
//                                     size: 12,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'TICKET NUMBER',
//                                       style: TextStyle(
//                                         fontSize: 10,
//                                         color: Color(0xFF6B7280),
//                                         letterSpacing: 0.5,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     SizedBox(height: 2),
//                                     Text(
//                                       'NG-789612',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w600,
//                                         color: Color(0xFF111827),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 2),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: 16,
//                                 height: 16,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFFDCEEFF),
//                                   borderRadius: BorderRadius.circular(6),
//                                 ),
//                                 child: Center(
//                                   child: Icon(
//                                     Icons.location_on_outlined,
//                                     color: Colors.blue,
//                                     size: 12,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'LOCATION',
//                                       style: TextStyle(
//                                         fontSize: 10,
//                                         color: Color(0xFF6B7280),
//                                         letterSpacing: 0.5,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     SizedBox(height: 2),
//                                     Text(
//                                       'Kollam, Kerala',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w600,
//                                         color: Color(0xFF111827),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           'Predicition',
//                           style: TextStyle(
//                             fontSize: 9,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.black,
//                           ),
//                         ),
//                         SizedBox(width: 3),
//                         Icon(
//                           Icons.verified,
//                           color: Color(0xFF10B981),
//                           size: 14,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 2),
//               Divider(color: Color(0xFFB3D9FF), thickness: 1.0),
//               // Footer with Date and Verified Status
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'WON ON 15 OCT 2025',
//                     style: TextStyle(
//                       fontSize: 9,
//                       color: Color(0xFF6B7280),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 8,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF10B981),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       SizedBox(width: 6),
//                       Text(
//                         'VERIFIED',
//                         style: TextStyle(
//                           fontSize: 9,
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ziya_lottery_app/Constants/app_colors.dart';
// import 'package:ziya_lottery_app/Home/models/lottery.dart';
// import 'package:ziya_lottery_app/common_widgets/gradient_container.dart';

// class RecentWinnerCard extends StatelessWidget {
//   final WinnerModel winner;

//   const RecentWinnerCard({super.key, required this.winner});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8.w),
//       width: 330.w,

//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Color(0xFFEBF5FF), Color(0xFFDCEEFF)],
//         ),
//         borderRadius: BorderRadius.circular(16.r),
//         border: Border.all(color: const Color(0xFFB3D9FF), width: 2),
//       ),
//       padding: EdgeInsets.all(16.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           /// 🏆 Header Row
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GradientContainer(
//                 height: 35.w,
//                 width: 35.w,
//                 child: Image.asset('assets/icons/trophy.png'),
//               ),
//               SizedBox(width: 12.w),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       winner.name,
//                       style: TextStyle(
//                         fontSize: 13.sp,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xFF111827),
//                       ),
//                     ),
//                     SizedBox(height: 2.h),
//                     Text(
//                       winner.lotteryName,
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         color: const Color(0xFF2563EB),
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           SizedBox(height: 6.h),

//           /// 🎫 Ticket and Location Info Box
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             padding: EdgeInsets.all(12.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 /// Left Info Section
//                 Expanded(
//                   child: Column(
//                     children: [
//                       /// Ticket number
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 16.w,
//                             height: 16.w,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFD1FAE5),
//                               borderRadius: BorderRadius.circular(6.r),
//                             ),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.confirmation_number_outlined,
//                                 color: Colors.green,
//                                 size: 12,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 12.w),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'TICKET NUMBER',
//                                   style: TextStyle(
//                                     fontSize: 10.sp,
//                                     color: const Color(0xFF6B7280),
//                                     letterSpacing: 0.5,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h),
//                                 Text(
//                                   winner.ticketNumber,
//                                   style: TextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: const Color(0xFF111827),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 6.h),

//                       /// Location
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 16.w,
//                             height: 16.w,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFDCEEFF),
//                               borderRadius: BorderRadius.circular(6.r),
//                             ),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.location_on_outlined,
//                                 color: Colors.blue,
//                                 size: 12,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10.w),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'LOCATION',
//                                   style: TextStyle(
//                                     fontSize: 10.sp,
//                                     color: const Color(0xFF6B7280),
//                                     letterSpacing: 0.5,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 SizedBox(height: 2.h),
//                                 Text(
//                                   winner.location,
//                                   style: TextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600,
//                                     color: const Color(0xFF111827),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 /// Right Prediction Status
//                 Row(
//                   children: [
//                     Text(
//                       winner.prediction,
//                       style: TextStyle(
//                         fontSize: 9.sp,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.black,
//                       ),
//                     ),
//                     SizedBox(width: 3.w),
//                     const Icon(
//                       Icons.verified,
//                       color: Color(0xFF10B981),
//                       size: 14,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           SizedBox(height: 4.h),
//           Divider(color: const Color(0xFFB3D9FF), thickness: 1.0),

//           /// 📅 Footer with Date + Verified status
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 winner.dateWon.toUpperCase(),
//                 style: TextStyle(
//                   fontSize: 9.sp,
//                   color: const Color(0xFF6B7280),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 8.w,
//                     height: 8.w,
//                     decoration: const BoxDecoration(
//                       color: Color(0xFF10B981),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   SizedBox(width: 6.w),
//                   Text(
//                     'VERIFIED',
//                     style: TextStyle(
//                       fontSize: 9.sp,
//                       fontWeight: FontWeight.w500,
//                       color: AppColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Home/models/lottery.dart';
import 'package:ziya_lottery_app/common_widgets/gradient_container.dart';

class RecentWinnerCard extends StatelessWidget {
  final WinnerModel winner;
  final bool fullWidth;

  const RecentWinnerCard({
    super.key,
    required this.winner,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    // Use full width or a fallback width for smaller cards
    final double cardWidth = fullWidth ? double.infinity : 330.w;

    return Container(
      width: cardWidth,
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 6.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEBF5FF), Color(0xFFDCEEFF)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFB3D9FF), width: 2),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 🏆 Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientContainer(
                height: 35.w,
                width: 35.w,
                child: Image.asset('assets/icons/trophy.png'),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      winner.name,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111827),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      winner.lotteryName,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: const Color.fromARGB(255, 235, 37, 86),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 6.h),

          /// 🎫 Ticket and Location Info Box
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Left Info Section
                Expanded(
                  child: Column(
                    children: [
                      /// Ticket number
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD1FAE5),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.confirmation_number_outlined,
                                color: Colors.green,
                                size: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TICKET NUMBER',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: const Color(0xFF6B7280),
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  winner.ticketNumber,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),

                      /// Location
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCEEFF),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Colors.blue,
                                size: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'LOCATION',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: const Color(0xFF6B7280),
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  winner.location,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Right Prediction Status
                Row(
                  children: [
                    Text(
                      winner.prediction,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    const Icon(
                      Icons.verified,
                      color: Color(0xFF10B981),
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 4.h),
          Divider(color: const Color(0xFFB3D9FF), thickness: 1.0),

          /// 📅 Footer with Date + Verified status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                winner.dateWon.toUpperCase(),
                style: TextStyle(
                  fontSize: 9.sp,
                  color: const Color(0xFF6B7280),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'VERIFIED',
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
