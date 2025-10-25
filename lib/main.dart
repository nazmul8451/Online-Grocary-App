import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'firebase_options.dart';


 Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();// initialization get Storage
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
        builder: (context)=>MaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
      home: GroceryApp(),
    ))
  );
}

