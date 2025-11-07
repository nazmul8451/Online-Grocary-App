
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_grocery_app/businessLogic/controller/product_controller.dart';
import 'package:provider/provider.dart';
import 'Ui/controller/auth_controller.dart';
import 'app.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // initializ get Storage
  await AuthController.getUserData();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProductControllerr()),
    ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          home: GroceryApp(),
        ),
      ),
    )

  );
}
