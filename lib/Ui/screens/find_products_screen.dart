import 'package:flutter/material.dart';
import 'package:online_grocery_app/data/grocary_data.dart';

class FindProductScreen extends StatefulWidget {
  const FindProductScreen({super.key});

  static const String name = '/find-product-screen';

  @override
  State<FindProductScreen> createState() => _FindProductScreenState();
}

class _FindProductScreenState extends State<FindProductScreen> {

  GrocaryData grocaryData = GrocaryData();

// Responsive Grid Count
  int _getGridCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1200) return 4; // Web
    if (width > 800) return 3;  // Tablet
    if (width > 600) return 2;  // Large Mobile
    return 2; // Mobile
  }

// Responsive Aspect Ratio
  double _getAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1200) return 1.2; // Web
    if (width > 800) return 1.1;  // Tablet
    return 1.0; // Mobile
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    double contentWidth;
    // my responsive condition
    if (size.width > 800) {
      //web screen
      contentWidth = size.width * 0.5;
    } else if (size.width > 600) {
      //tab screen
      contentWidth = size.width * 0.7;
    } else {
      //mobile
      contentWidth = size.width;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Find Products'),
      ),
      body: Column(
        children: [
          Container(
            width: contentWidth,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFF3F4F9),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Search Store',
                        style: TextStyle(color: Color(0xFF7C7C7C)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(), // scrollable রাখলে overflow কম হয়
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getGridCount(context),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: _getAspectRatio(context),
                ),
                itemCount: GrocaryData.findProducts.length,
                itemBuilder: (context, index) {
                  final item = GrocaryData.findProducts[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(item['c_color']),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(item['b_color']), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 120,
                            child: Image.asset(item['image']),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              item['name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}
