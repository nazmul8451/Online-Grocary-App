import 'package:flutter/material.dart';
import 'package:online_grocery_app/data/model/products_model.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key, required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      width: 170,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFE2E2E2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Image.network(
                (product.images != null && product.images!.isNotEmpty)
                    ? product.images!.first.url! : "",// fallback image
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                      Icons.broken_image, size: 40, color: Colors.grey);
                },
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  product.category!.name!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFF53B175)
                      ),
                      child: Center(child: Icon(
                        Icons.add, color: Colors.white, size: 30,),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]
        ,
      )
      ,
    );
  }
}
