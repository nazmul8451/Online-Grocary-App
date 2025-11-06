import 'package:flutter/material.dart';

class FindProductScreen extends StatefulWidget {
  const FindProductScreen({super.key});
  static const String name = '/find-product-screen';

  @override
  State<FindProductScreen> createState() => _FindProductScreenState();
}

class _FindProductScreenState extends State<FindProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        centerTitle:true,
        title:Text('Find Products',),
      )
    );
  }
}