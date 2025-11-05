import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_grocery_app/Ui/widgets/custom_carousel_slider.dart';
import 'package:online_grocery_app/businessLogic/controller/product_controller.dart';
import 'package:provider/provider.dart';
import '../controller/auth_controller.dart';
import '../widgets/custom_product_card.dart';
import 'log_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _logOutUser(BuildContext context) async {
    await AuthController.clearData();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LogInScreen()),
      (route) => false,
    );
  }

  final box = GetStorage();
  String? userLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userLocation = box.read('user_location');
    Future.microtask(() {
      Provider.of<ProductControllerr>(context, listen: false).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    double getResponsiveFontSize(BuildContext context, double baseSize) {
      final width = MediaQuery.of(context).size.width;

      if (width > 1000) {
        // Desktop / Large Web
        return baseSize * 1.6;
      } else if (width > 600) {
        // Tablet
        return baseSize * 1.3;
      } else {
        // Mobile
        return baseSize;
      }
    }

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
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/vector_orange.png',
                  height: 30,
                  width: 30,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.grey),
                    Text(
                      userLocation.toString() ?? 'No location selected yet',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

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

                SizedBox(height: 20),
                SizedBox(width: contentWidth, child: CustomCarousel()),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exclusive Offer',
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context, 20),
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context, 15),
                          color: const Color(0xFF53B175),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 240,
                  child: Consumer<ProductControllerr>(
                    builder: (context, controller, child) {
                      return controller.allProducts.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.allProducts.length,
                              itemBuilder: (context, index) {
                                final product = controller.allProducts[index];
                                return ProductCard(product: product);
                              },
                            );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Selling',
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context, 20),
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context, 15),
                          color: const Color(0xFF53B175),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  height: 240,
                  child: Consumer<ProductControllerr>(
                    builder: (context, controller, child) {
                      return controller.allProducts.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.allProducts.length,
                              itemBuilder: (context, index) {
                                final product = controller.allProducts[index];
                                return ProductCard(product: product);
                              },
                            );
                    },
                  ),
                ),
                
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Groceries',
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context, 20),
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context, 15),
                          color: const Color(0xFF53B175),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
