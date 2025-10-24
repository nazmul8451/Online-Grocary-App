import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:online_grocery_app/Ui/widgets/snackBar_message.dart';
import 'package:online_grocery_app/data/services/post_request.dart';
import 'package:online_grocery_app/data/services/urls.dart' show Urls;
// ignore: depend_on_referenced_packages
import '../../core/widgets/background.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../data/services/networkCaller.dart';
import 'log_in_screen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  bool _obscureText = true;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Enter your credentials to continue',
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
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[800],
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value?.trim().isEmpty ?? true) {
                                    return 'Enter your Last name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: emailController,
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
                                validator: (String? value) {
                                  String email = value ?? '';
                                  if (EmailValidator.validate(email) == false) {
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
                                    borderSide: BorderSide(color: Colors.grey),
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
                        SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            text: 'By continuing you agree to our ',
                            style: TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(
                                text: 'Terms of Service ',
                                style: TextStyle(color: Color(0xFF53B175)),
                              ),
                              TextSpan(text: 'and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(color: Color(0xFF53B175)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Visibility(
                          visible: isLoading == false,
                          replacement: Center(
                            child: CircularProgressIndicator(color: Colors.green,),
                          ),
                          child: GestureDetector(
                            onTap: _onTapSignUpButton,
                            child: Custom_elavetedButton(
                              widht: size.width,
                              buttonName: 'Sign Up',
                              buttonColor: Color(0xFF53B175),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Log in',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _login(),
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
    );
  }

   void _onTapSignUpButton() {
  if (_formKey.currentState!.validate()) {
    signUp();
  }
}
Future<void> signUp() async {

    setState(() => isLoading = true);

    Map<String, String> requestBody = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    };

    NetworkResponse response = await NetworkCaller.postRequest(url: Urls.registrationUrl,body: requestBody);
    if(response.isSuccess){
      print('Account success');
      setState(() => isLoading = false);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
      showSnackBarMessage(context, 'Sign up successfull, please log in!');

    }else{
      print('Account failed');
      showSnackBarMessage(context, response.body.toString());
    }
}



  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogInScreen()),
    );
  }
}
