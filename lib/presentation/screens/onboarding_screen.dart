import 'package:flutter/material.dart';
import 'package:online_grocery_app/presentation/screens/log_in_screen.dart';

import '../../core/widgets/custom_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    double widht;
    if (width < 600) {
      widht = width * 0.9;
    } else {
      widht = 500;
    }
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboard_person.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/vector01.png',
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome\nto our store',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Ger your groceries in as fast as one hour',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                        onTap: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => LogInScreen())),
                        child: Custom_elavetedButton(
                          widht: widht,
                          buttonName: 'Get Started',
                          buttonColor: Color(0xFF53B175),)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
