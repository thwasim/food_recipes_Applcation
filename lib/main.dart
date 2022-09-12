import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/pages/bottom_nav_bar/controller/bottom_nav_controller.dart';
import 'package:food_recipes/pages/home/controller/homecontroller.dart';
import 'package:food_recipes/pages/login/controller/logincontroller.dart';
import 'package:food_recipes/pages/login/view/login_page.dart';
import 'package:food_recipes/pages/signup/controller/signupcontroller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) => LoginCntroller()),
       ChangeNotifierProvider(create: (_)=>SignUpController()),
       ChangeNotifierProvider(create: (_)=>HomeController()),
       ChangeNotifierProvider(create: (_)=>BottomNavController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const LoginScreen(),
    );
  }
}
 