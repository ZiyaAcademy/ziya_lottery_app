import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziya_lottery_app/Authentication/view/forgot_password_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/login_screen.dart';
import 'package:ziya_lottery_app/Authentication/view/welcome_screen.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lottery App',
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
          initialRoute: '/',
          routes: {
            '/': (context) => const WelcomeView(),
            '/signin': (context) => const SignInView(),
            '/forgot-password': (context) => const ForgotPasswordView(),
          },
        );
      },
    );
  }
}
