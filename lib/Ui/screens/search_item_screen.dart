import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/widgets/cart_item_container.dart';
import 'package:online_grocery_app/Ui/widgets/custom_product_card.dart';
import 'package:online_grocery_app/businessLogic/controller/product_controller.dart';
import 'package:provider/provider.dart';

class SearchItemScreen extends StatefulWidget {
  const SearchItemScreen({super.key});

  @override
  State<SearchItemScreen> createState() => _SearchItemScreenState();
}

class _SearchItemScreenState extends State<SearchItemScreen> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSearchAppBar(context, _controller, _focusNode),
      body: Consumer<ProductControllerr>(
        builder: (context, controller, child) {

          final results = _controller.text.isEmpty ? controller.allProducts: controller.searchProductList;
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (results.isEmpty) {
            return const Center(child: Text("No products found"));
          }

          return  LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth;

              // 📱 mobile, tablet, desktop responsive grid setup
              int crossAxisCount;
              if (width < 600) {
                crossAxisCount = 2; // phones
              } else if (width < 900) {
                crossAxisCount = 3; // small tablets
              } else {
                crossAxisCount = 5; // large tablets / desktop
              }

              return GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: results.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = results[index];
                  return ProductCard(product: product);
                },
              );
            },
          );

        },
      ),
    );
  }
}

PreferredSizeWidget buildSearchAppBar(
  BuildContext context,
  TextEditingController _controller,
  FocusNode _focusNode,
) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    titleSpacing: 0,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),

          SizedBox(width: 12),

          Expanded(
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: (value){
                  final controller = Provider.of<ProductControllerr>(context,listen: false);
                  if(value.isNotEmpty){
                    controller.searchProduct(value);
                  }else {
                    controller.searchProductList = [];
                    controller.notifyListeners();
                  }

                },
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: "Egg",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        ],
      ),
    ),
  );
}
