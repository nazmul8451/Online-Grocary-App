import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/widgets/cart_item_container.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('My Cart',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: 7,
                  itemBuilder: (context,index){
            return CartItem();
          }))
        ],
      ),
    );
  }
}
