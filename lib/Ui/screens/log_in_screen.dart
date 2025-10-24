import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/widgets/snackBar_message.dart';
import 'package:online_grocery_app/data/services/networkCaller.dart';
import 'package:online_grocery_app/data/services/urls.dart';
import '../../core/widgets/BottomNavBar.dart';
import '../../core/widgets/background.dart';
import '../../core/widgets/custom_elevated_button.dart';
import 'SignUpScreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool isLogInProgress = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            //screen widht check
            bool isWide = constraints.maxWidth > 400;
            return Stack(
              children: [
                if (!isWide) Background_shadow(),
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
                      physics: BouncingScrollPhysics(),
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
                                  fontSize: 23,
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    String email = value ?? '';
                                    if (EmailValidator.validate(email) ==
                                        false) {
                                      return 'Enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 30),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[800],
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if ((value?.length ?? 0) <= 6) {
                                      return 'Enter a valid password';
                                    }
                                    return null;
                                  },
                                ),
                              ],
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
                          GestureDetector(
                            onTap: () => _onTapLogInButton(),
                            child: Visibility(
                              visible: isLogInProgress == false,
                              replacement: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              ),
                              child: Custom_elavetedButton(
                                widht: size.width,
                                buttonName: 'Log in',
                                buttonColor: Color(0xFF53B175),
                              ),
                            ),
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
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Sign up',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => _onTapSignUpButton(),
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onTapLogInButton() {
    if (_formKey.currentState!.validate()) {
      //TODO:call log in api
      logIn();
    }
  }

  Future<void> logIn() async {
    setState(() {
      isLogInProgress = true;
    });

    Map<String, String> requestBody = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );

    if(response.isSuccess){
      showSnackBarMessage(context, "Login Success");
      Navigator.pushNamedAndRemoveUntil(context, BotomNavBar.name, (predicate)=>false);
    }{
      setState(() {
        isLogInProgress = false;
      });
      showSnackBarMessage(context, "Login Failed");
    }

  }

  // void _onTapLogin(){
  //   Navigator.push(context,MaterialPageRoute(builder: (context)=> BotomNavBar()));
  // }
  void _onTapSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signupscreen()),
    );
  }
}
