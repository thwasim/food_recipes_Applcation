import 'package:flutter/material.dart';

class RecipesDetailsScreen extends StatelessWidget {
  const RecipesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 20, 163, 134),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.32,
        ),
        Positioned(
            top: 28,
            left: 20,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    )));
  }
}
