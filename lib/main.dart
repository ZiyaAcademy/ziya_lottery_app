// lib/main.dart (Final Fix)

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// --- Import necessary project files ---
import 'package:ziya_lottery_app/Authentication/view/forgot_password_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/login_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/welcome_screen.dart';
import 'package:ziya_lottery_app/Histroy/view_model/prediction_history_view_model.dart';
import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';
import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';
import 'package:ziya_lottery_app/Result/view/result_screen.dart';
import 'package:ziya_lottery_app/Result/widgets/custom_bottom_nav_bar.dart'; 
import 'package:ziya_lottery_app/Constants/app_colors.dart'; 



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LotteryViewModel()),
       ChangeNotifierProvider(create: (_) => PredictionHistoryViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),

      ],
      child: const MyApp(), 
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
 
      designSize: const Size(392.7, 850), 
      minTextAdapt: true,
      splitScreenMode: true,
      
      // 💡 NOTE: The builder structure is correct for ScreenUtilInit.
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lottery App',
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor: AppColors.backgroundGrey,
          ),
          // Launch the BottomNavigation to show the working UI
          home: const BottomNavigation(), 
          routes: {
            '/welcome': (context) => const WelcomeView(), 
            '/signin': (context) => const SignInView(),
            '/forgot-password': (context) => const ForgotPasswordView(),
          },
        );
      },
    );
  }
}