import 'package:flutter/material.dart';

class Background_shadow extends StatelessWidget {
  const Background_shadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/back_shadow.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
