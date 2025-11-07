import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../businessLogic/controller/product_controller.dart';
import '../../core/widgets/custom_elevated_button.dart';

class SingleProductScreen extends StatefulWidget {
  final int productID;
  const SingleProductScreen({super.key, required this.productID});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  double imageHeight = 180;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProductControllerr>(context, listen: false)
          .getSingleProduct(widget.productID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProductControllerr>(
        builder: (context, controller, child) {
          final product = controller.singleProduct;
          if (product == null) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          return Stack(
            children: [
              /// 🔹 Background container (upper transparent section)
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.grey.shade200.withOpacity(0.7),
                ),
              ),

              /// 🔹 SafeArea icons (Back & Share)
              SafeArea(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.ios_share_outlined),
                      ),
                    ],
                  ),
                ),
              ),

              /// 🔹 Product image
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    height: imageHeight,
                    child: (product.image != null && product.image!.isNotEmpty)
                        ? Image.network(
                      product.image!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image, size: 50);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                            child: CircularProgressIndicator());
                      },
                    )
                        : const Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
              ),

              /// 🔹 Bottom section
              Column(
                children: [
                  const SizedBox(height: 330),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            /// Product name & wishlist
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name ?? "No name",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      product.stockStatus ?? "Unknown",
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_outlined),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            /// Quantity & price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.remove)),
                                    const SizedBox(width: 5),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border:
                                        Border.all(color: Colors.grey),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                                Text(
                                  '\$${product.price ?? 0}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),
                            const Divider(),

                            /// 🔹 Product Details Section
                            Theme(
                              data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                tilePadding: EdgeInsets.zero,
                                childrenPadding: const EdgeInsets.only(
                                    top: 0, bottom: 13),
                                title: const Text(
                                  'Product Detail',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                children: [
                                  Text(
                                    product.description ?? "No description available",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),

                            /// 🔹 Nutrition Section
                            Theme(
                              data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent),
                              child: const ExpansionTile(
                                tilePadding: EdgeInsets.zero,
                                childrenPadding: EdgeInsets.only(
                                    top: 0, bottom: 13),
                                title: Text(
                                  'Nutritions',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                children: [
                                  Text(
                                    'Apples are nutritious. Apples may be good for weight loss. '
                                        'Apples may be good for your heart. As part of a healthful and varied diet.',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),

                            /// 🔹 Review Section
                            Theme(
                              data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent),
                              child: const ExpansionTile(
                                tilePadding: EdgeInsets.zero,
                                childrenPadding: EdgeInsets.only(
                                    top: 0, bottom: 8),
                                title: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Review',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 18),
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 18),
                                        Icon(Icons.star,
                                            color: Colors.orange, size: 18),
                                        Icon(Icons.star_half,
                                            color: Colors.orange, size: 18),
                                        Icon(Icons.star_border,
                                            color: Colors.orange, size: 18),
                                        SizedBox(width: 5),
                                        Text(
                                          '(4.5)',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      'Apples are nutritious. Apples may be good for weight loss. '
                                          'Apples may be good for your heart. As part of a healthful and varied diet.',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          height: 1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// 🔹 Add to Basket Button
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Custom_elavetedButton(
                      widht: double.infinity,
                      buttonName: "Add To Basket",
                      buttonColor: const Color(0xFF53B175),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
