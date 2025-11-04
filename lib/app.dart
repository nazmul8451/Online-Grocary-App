import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/screens/signUpScreen.dart';
import 'package:online_grocery_app/Ui/screens/splash_screen.dart' show SplashScreen;

import 'core/widgets/BottomNavBar.dart';
class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  SplashScreen(),
      routes: {
        BotomNavBar.name: (context) => BotomNavBar(),
      },
    );
  }
}

