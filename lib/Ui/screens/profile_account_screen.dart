import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/controller/auth_controller.dart';
import 'package:online_grocery_app/Ui/screens/profile_item_screen/delivery_screen.dart';
import 'package:online_grocery_app/Ui/screens/profile_item_screen/my_details_screen.dart';
import 'package:online_grocery_app/Ui/screens/profile_item_screen/order_screen.dart';

import 'log_in_screen.dart';
class MenuItem {
  final String title;
  final IconData icon;
  final Widget screen;

  MenuItem({required this.title, required this.icon, required this.screen});
}

class ProfileAccountScreen extends StatelessWidget {
   ProfileAccountScreen({super.key});

  Future<void> _logOutUser(BuildContext context) async {
    await AuthController.clearData();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LogInScreen()),
      (route) => false,
    );
  }

  final List<MenuItem> menuItems = [
    MenuItem(title: "Orders", icon: Icons.shopping_bag, screen: OrderScreen()),
    MenuItem(title: "My Details", icon: Icons.person, screen: MyDetailsScreen()),
    MenuItem(title: "Delivery Address", icon: Icons.location_on, screen: DeliverScreen()),
    MenuItem(title: "Payment Methods", icon: Icons.credit_card, screen: OrderScreen()),
    MenuItem(title: "Promo Code", icon: Icons.card_giftcard, screen: MyDetailsScreen()),
    MenuItem(title: "Notifications", icon: Icons.notifications, screen: DeliverScreen()),
    MenuItem(title: "Help", icon: Icons.help, screen: MyDetailsScreen()),
    MenuItem(title: "About", icon: Icons.info, screen: DeliverScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    final user = AuthController.userModel;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                  child: Icon(Icons.person, color: Colors.grey),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.data?.username ?? "Guest User",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      user?.data?.email ?? "Guest User",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20,),
            Divider(),

            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                  itemBuilder: (context,index){
                  var item = menuItems[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: (){
                        },
                        leading: Icon(item.icon),
                        title: Text(item.title,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                        trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                      ),
                      Divider(color:Color(0xFFE2E2E2) ,)
                    ],
                  );
              }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFF2F3F2)
              ),
                child: GestureDetector(
                  onTap: ()=>_logOutUser,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(

                            Icons.logout, color: Color(0xFF53B175)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,color:Color(0xFF53B175)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
