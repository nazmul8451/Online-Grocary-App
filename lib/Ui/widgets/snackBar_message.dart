import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void showSnackBarMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}