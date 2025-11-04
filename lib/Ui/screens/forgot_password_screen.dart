import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:online_grocery_app/data/services/networkCaller.dart';

import '../../core/widgets/custom_elevated_button.dart';
import '../../data/services/urls.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey[800]),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                validator: (String? value) {
                  String email = value ?? '';
                  if (EmailValidator.validate(email) == false) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: isLoading == false,
              replacement: Center(child: CircularProgressIndicator(color: Colors.green,),),
              child: GestureDetector(onTap: ()=>onTapResetButton(),
                child: Custom_elavetedButton(
                  widht: size.width,
                  buttonName: 'Send Reset Link',
                  buttonColor: Color(0xFF53B175),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapResetButton() {
    if (_formKey.currentState!.validate()) {
      forgotPass();
    }
  }

  Future<void> forgotPass() async {
    isLoading = true;
    setState(() {});
    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.forgotPasswordUrl,
      body: {"email": emailController.text.trim()},
    );
    if (response.isSuccess) {
      String resetLink = response.body?['data']['reset_link'] ?? '';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Reset link sent! Check your email.'),
          backgroundColor: Colors.green,
        ),
      );
      emailController.clear();
    } else {
      String errorMessage = response.body?['message'] ?? 'Unknown error';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }

    isLoading = false;
    setState(() {

    });
  }
}
