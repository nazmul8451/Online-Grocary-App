import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/controller/auth_controller.dart';
import 'package:online_grocery_app/Ui/screens/log_in_screen.dart';
import 'package:online_grocery_app/Ui/screens/onboarding_screen.dart';

import '../../core/widgets/BottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }


  Future<void> moveToNextScreen() async {
    Future.delayed(const Duration(seconds: 3), () async {
      bool isLoggedIn = await AuthController.isUserLoggedIn();
      bool isFirstTime = await AuthController.isFirstTimeUser();

      if (isLoggedIn && isFirstTime) {
        // New user, first launch -show onboarding
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      } else if (isLoggedIn) {
        // Already logged in → go to home
        Navigator.pushReplacementNamed(context, BotomNavBar.name);
      } else {
        // Logged out user → show login screen directly
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogInScreen()),
        );
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double imageHeight;
    double imageWidth;
    if (width < 600) {
      imageWidth = width * 0.5;
      imageHeight = height * 0.2;
    } else if (width < 1200) {
      imageWidth = width * 0.4;
      imageHeight = height * 0.25;
    } else {
      imageWidth = width * 0.3;
      imageHeight = height * 0.3;
    }
    return Scaffold(
      backgroundColor: const Color(0xFF53B175),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Image.asset(
            'assets/images/splash_name.png',
            width: imageWidth,
            height: imageHeight,
          ),
        ),
      ),
    );
  }
}
