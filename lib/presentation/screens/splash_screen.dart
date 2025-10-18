import 'package:flutter/material.dart';
import 'package:online_grocery_app/presentation/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //device type check
    double imageHeight;
    double imageWidth;

    if (width < 600) {
      //for mobile
      imageWidth = width * 0.5;
      imageHeight = height * 0.2;
    } else if (width < 1200) {
      //for tablet
      imageWidth = width * 0.4;
      imageHeight = height * 0.25;
    } else {
      //for web
      imageWidth = width * 0.3;
      imageHeight = height * 0.3;
    }
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate here to next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Color(0xFF53B175),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
