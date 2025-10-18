import 'package:flutter/material.dart';
class Custom_elavetedButton extends StatelessWidget {
  Custom_elavetedButton({
    super.key,
    required this.widht,
    required this.buttonName,
  });

  final double widht;
  String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: widht,
      decoration: BoxDecoration(
        color: Color(0xFF53B175),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
