import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_admin/controller/home_controller.dart';
import 'package:shoping_admin/firebase_options.dart';
import 'package:shoping_admin/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:firebaseOptions );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Registering my controller here, before returning the MaterialApp widget
    Get.put(HomeController());

    return GetMaterialApp(  // Use GetMaterialApp to make GetX features available
      title: 'Shopping app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
