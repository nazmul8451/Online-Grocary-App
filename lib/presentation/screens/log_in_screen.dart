import 'package:flutter/material.dart';

import '../../core/widgets/background.dart';
import '../../core/widgets/custom_elevated_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          //screen widht check
          bool isWide = constraints.maxWidth > 400;
          return Stack(
            children:[
              if(!isWide) Background_shadow(),
              Center(
              child: Container(
                width: isWide ? 400 : size.width,
                padding: const EdgeInsets.all(20),
                margin: isWide ? const EdgeInsets.all(40) : EdgeInsets.zero,
                decoration: isWide
                    ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                )
                    : null,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/vector_orange.png',
                          height: 60,
                          width: 60,
                        ),
                      ),
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Enter your emails and password',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Custom_elavetedButton(
                        widht: size.width,
                        buttonName: 'Log in',
                        buttonColor: Color(0xFF53B175),
                      ),
                      SizedBox(height: 20),
                      Custom_elavetedButton(
                        widht: size.width,
                        buttonName: 'Continue with Google',
                        buttonColor: Color(0xFF5383EC),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            children: [
                              TextSpan(
                                text: 'Signup',
                                style: TextStyle(color: Color(0xFF53B175)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),],
          );
        },
      ),
    );
  }
}
