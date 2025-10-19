import 'package:flutter/material.dart';
class Custom_elavetedButton extends StatelessWidget {
  Custom_elavetedButton({
    required this.widht,
    required this.buttonName,
    required this.buttonColor,
  });

  final double widht;
  String buttonName;
  Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widht,
      decoration: BoxDecoration(
        color: Color(buttonColor.toARGB32()),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
