import 'package:flutter/material.dart';
import 'package:food_recipes/pages/splash/view/splash_screen.dart';

class Splashcontroller with ChangeNotifier {
  Future<void> gohome(context) async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const CheckUser()));
  }
}
