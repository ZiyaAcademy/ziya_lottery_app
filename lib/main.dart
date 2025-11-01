import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:ziya_lottery_app/Authentication/view/forgot_password_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/login_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/reset_password_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/sign_up_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/verify_otp_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/verify_success_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/welcome_screen.dart';
import 'package:ziya_lottery_app/Authentication/view_model/auth_vm.dart';
import 'package:ziya_lottery_app/features/HelpSupport/view_models/help_support_vm.dart';
import 'package:ziya_lottery_app/Home/view_models/home_vm.dart';
import 'package:ziya_lottery_app/Home/views/home_screen.dart';
import 'package:ziya_lottery_app/Notification/view/notification_view.dart';
import 'package:ziya_lottery_app/Notification/view_models/notification_vm.dart';
import 'package:ziya_lottery_app/Prediction_section/view_models/prediction.vm.dart';
import 'package:ziya_lottery_app/Histroy/view_model/prediction_history_view_model.dart';
import 'package:ziya_lottery_app/ProfileScreen/view_model/profile_view_model.dart';
import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/common_widgets/bottomNav_bar.dart';
import 'package:ziya_lottery_app/features/privacy_policy/view_model/privacy_policy_vm.dart';
import 'package:ziya_lottery_app/features/terms_conditions/view_model/terms_conditions_vm.dart';

import 'package:ziya_lottery_app/subscriptionSection/view_model/subscription_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => NotificationViewModel()),
        ChangeNotifierProvider(create: (_) => PredictionViewModel()),
        ChangeNotifierProvider(create: (_) => LotteryViewModel()),
        ChangeNotifierProvider(create: (_) => SubscriptionViewModel()),
        ChangeNotifierProvider(create: (_) => PredictionHistoryViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => HelpSupportViewModel()),
        ChangeNotifierProvider(create: (_) => TermsConditionsViewModel()),
        ChangeNotifierProvider(create: (_) => PrivacyPolicyViewModel()),
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
            '/signup': (context) => const SignUpView(),
            '/VerifyOtpView': (context) => const VerifyOtpView(),
            '/forgot-password': (context) => const ForgotPasswordView(),
            '/reset-password': (context) => const ResetPasswordView(),
            '/verifySuccess': (context) => const VerifySuccsessfullScreen(),
            '/home': (context) => const HomeScreen(),
            '/notification': (context) => const NotificationView(),
            '/bottomNav': (context) => const BottomNavigation(),
          },
        );
      },
    );
  }
}
