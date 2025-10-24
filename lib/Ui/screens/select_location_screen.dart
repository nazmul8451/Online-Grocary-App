import 'package:flutter/material.dart';
import 'package:online_grocery_app/core/widgets/background.dart';
import 'package:online_grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:online_grocery_app/Ui/screens/location_screen.dart';
class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Background_shadow(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Image.asset('assets/images/location_img.png',height: 160,width: 250,)),
                ),
                SizedBox(height: 20,),
                Text('Select Your Location',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600,)),
              SizedBox(height: 10,),
              Text('Swithch on your location to stay in tune with what’s happening in your area',
                style: TextStyle(color: Colors.grey,fontSize: 14,),textAlign: TextAlign.center,),

                GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen())),
                  child: Container(
                    height: 50,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                      border:  Border.all(width: 1,color: Colors.black)
                    ),
                    child: ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      trailing: Icon(Icons.location_searching),
                    )
                  ),
                ),

                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Custom_elavetedButton(widht: width, buttonName: 'Submit', buttonColor: Color(0xFF0FF53B175)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
