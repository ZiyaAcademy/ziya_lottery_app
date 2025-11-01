import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  // -------------------- Controllers --------------------
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // -------------------- State Variables --------------------
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;
  bool rememberMe = false;
  String otpCode = "";

  // -------------------- Password Visibility --------------------
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  // -------------------- Remember Me --------------------
  void toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  // -------------------- Authentication Actions --------------------
  Future<void> signIn(BuildContext context) async {
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      _showMessage(context, "Please enter phone and password");
      return;
    }
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);

    Navigator.pushNamedAndRemoveUntil(context, '/bottomNav', (route) => false);
  }

  Future<void> signUp(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      _showMessage(context, "Passwords do not match");
      return;
    }
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);

    Navigator.pushNamed(context, '/VerifyOtpView');
  }

  Future<void> sendForgotPasswordCode(BuildContext context) async {
    if (phoneController.text.isEmpty) {
      _showMessage(context, "Enter your phone number");
      return;
    }
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);
    Navigator.pushNamed(context, '/VerifyOtpView');
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    if (otp.length != 4) {
      _showMessage(context, "Enter valid OTP");
      return;
    }
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);

    Navigator.pushNamed(context, '/reset-password');
  }

  Future<void> resetPassword(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      _showMessage(context, "Passwords do not match");
      return;
    }
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);

    Navigator.pushNamed(context, '/verifySuccess');
  }

  // -------------------- Helpers --------------------
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void disposeControllers() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    locationController.dispose();
    otpController.dispose();
  }
}
