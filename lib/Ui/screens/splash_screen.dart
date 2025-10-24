import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
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
