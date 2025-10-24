import 'package:flutter/material.dart';

class Background_shadow extends StatelessWidget {
  const Background_shadow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/back_shadow.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
