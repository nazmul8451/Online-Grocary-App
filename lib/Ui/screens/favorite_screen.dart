import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/widgets/cart_item_container.dart';
import 'package:online_grocery_app/Ui/widgets/favorite_item_container.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('My Favorite',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context,index){
                    return FavoriteItem();
                  }))
        ],
      ),
    );
  }
}
