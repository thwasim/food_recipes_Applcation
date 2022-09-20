import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/pages/bottom_nav_bar/view/bottom.dart';
import 'package:food_recipes/pages/login/view/login_page.dart';
import 'package:food_recipes/pages/splash/controller/splash_controller.dart';
import 'package:provider/provider.dart';

class Screensplash extends StatelessWidget {
  const Screensplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Splashcontroller>().gohome(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 47, 97, 111),
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 47, 97, 111),
          ],
        )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
            ),
            Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/output-onlinegiftools.gif",
                      ),
                      fit: BoxFit.cover),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
                width: 200, height: 200, child: Image.asset("assets/lets.png")),
          ],
        )),
      ),
    );
  }
}

class CheckUser extends StatelessWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNav();
          } else {
            return const LoginScreen();
          }
        });
  }
}
