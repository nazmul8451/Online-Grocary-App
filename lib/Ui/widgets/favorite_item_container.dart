import 'package:flutter/material.dart';
class FavoriteItem extends StatelessWidget {
  // final Product product;
  // final Function(int) onQuantityChanged;

  const FavoriteItem({
    Key? key,
    // required this.product,
    // required this.onQuantityChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 12),
            child: Row(
              children: [
                // Product Image Placeholder
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.image, color: Colors.grey[400]),
                ),

                SizedBox(width: 16),

                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'product name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'details',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(children: [
                            Text(
                              "\$10.3",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 5,),
                            IconButton(onPressed: (){}, icon:Icon(Icons.navigate_next_sharp,color: Colors.grey,)),

                          ],)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFFE2E2E2),)
        ],
      ),
    );
  }
}