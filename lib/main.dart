import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:ziya_lottery_app/Authentication/view/forgot_password_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/login_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/welcome_screen.dart';
import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';
import 'package:ziya_lottery_app/Home/views/home_screen.dart';
import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';
import 'package:ziya_lottery_app/Histroy/view_model/prediction_history_view_model.dart';
import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';
import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/common_widgets/bottomNav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => PredictionViewModel()),
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
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lottery App',

          initialRoute: '/bottomNav',
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor: AppColors.backgroundGrey,
          ),

          routes: {
            '/welcome': (context) => const WelcomeView(),
            '/signin': (context) => const SignInView(),
            '/forgot-password': (context) => const ForgotPasswordView(),
            '/home': (context) => const HomeScreen(),
            '/bottomNav': (context) => const BottomNavigation(),
          },
        );
      },
    );
  }
}
