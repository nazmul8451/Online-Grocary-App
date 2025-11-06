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
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<ProductControllerr>(context, listen: false).getSingleProduct(widget.productID);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProductControllerr>(
        builder:(context,controller,child){
          final product = controller.singleProduct;
          if(product == null){
            return const Center(child: CircularProgressIndicator(color: Colors.green,),);
          }
          return Stack(
          children: [
            /// 🔹 Background container (transparent section)
            Container(
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.grey.shade200.withOpacity(0.7),
              ),
            ),

            /// 🔹 SafeArea icons (Back & Share)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.ios_share_outlined)),

                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  height: imageHeight,
                  child: (product.images != null && product.images!.isNotEmpty)
                      ? Image.network(
                    product.images!.first.url ?? '',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 50);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  )
                      : const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
            ),

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    product.name!,
                                    style: TextStyle(fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                   Text(
                                    product.stockStatus!,
                                    style: TextStyle(fontSize: 13,
                                        fontWeight: FontWeight.w300,color: Colors.grey),
                                  ),
                                ],
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined))
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon:Icon(Icons.remove,)),
                                  SizedBox(width: 5,),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: Colors.grey)
                                      // color: const Color(0xFF53B175),
                                    ),
                                    child: const Center(
                                      child: Text('1',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w100),),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  IconButton(onPressed: (){}, icon:Icon(Icons.add,)),
                                ],
                              ),
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),

                          Divider(),

                          //product details
                          Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              childrenPadding: const EdgeInsets.only(top: 0, bottom: 13),
                              title: const Text(
                                'Product Detail',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              children: [
                                Text(
                                  product.description ?? "No description available",
                                  style: const TextStyle(color: Colors.black,fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              childrenPadding: const EdgeInsets.only(top: 0, bottom: 13),
                              title: const Text(
                                'Nutritions',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              children: const [
                                Text(
                                  'Apples are nutritious. Apples may be good for weight loss. '
                                      'Apples may be good for your heart. As part of a healthful and varied diet.',
                                  style: TextStyle(color: Colors.black,fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              childrenPadding: const EdgeInsets.only(top: 0, bottom: 8),
                              // 🔹 এখানে title এ Row ব্যবহার করা হয়েছে
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Review',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.star, color: Colors.orange, size: 18),
                                      Icon(Icons.star, color: Colors.orange, size: 18),
                                      Icon(Icons.star, color: Colors.orange, size: 18),
                                      Icon(Icons.star_half, color: Colors.orange, size: 18),
                                      Icon(Icons.star_border, color: Colors.orange, size: 18),
                                      SizedBox(width: 5),
                                      Text(
                                        '(4.5)',
                                        style: TextStyle(fontSize: 13, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(
                                    'Apples are nutritious. Apples may be good for weight loss. '
                                        'Apples may be good for your heart. As part of a healthful and varied diet.',
                                    style: TextStyle(color: Colors.black, fontSize: 12, height: 1.3),
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

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Custom_elavetedButton(widht: double.infinity, buttonName: "Add To Busket", buttonColor:Color(0xFF53B175) ),
                )
                // Custom_elavetedButton(widht: double.infinity,, bttonnName: Text(data),buttonColor:Color(0xFF53B175) ,),
        ],
            ),
          ],
        );
  }
      ),
    );
  }
}